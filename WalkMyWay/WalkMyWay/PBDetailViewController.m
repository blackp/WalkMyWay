//
//  PBDetailViewController.m
//  WalkMyWay
//
//  Created by Philip Blackwell on 1/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import "PBDetailViewController.h"
#import "PBFinalStopAnnotation.h"

#define MIN_DELTA_DEGREES 0.005
#define MAX_DEGREES_NEARBY_STOP 0.002

@interface PBDetailViewController ()
- (void)configureView;
@end

@implementation PBDetailViewController

@synthesize detailItem = _detailItem;
@synthesize mapView;
@synthesize locationManager;
@synthesize currentLocation;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        NSArray *trips = [self.detailItem.trips allObjects];
        NSArray *scheduledStops;
        
        if (!stops) {
            stops = [[NSMutableSet alloc] initWithObjects:nil];
        } else {
            [stops removeAllObjects];
        }
        if (!finalStops) {
            finalStops = [[NSMutableSet alloc] initWithObjects:nil];
        } else {
            [finalStops removeAllObjects];
        }
        finalStopAnnotations = nil;
        filteredTrips = (NSMutableSet *) [self.detailItem.trips mutableCopy];
        
        for (int i = 0; i < [trips count]; i++) {
            Trip *trip = [trips objectAtIndex:i];
            if ([trip.service runsToday]) {
                ScheduledStop *scheduledStop;
                scheduledStops = [trip.scheduledStops allObjects];
                for (int j = 0; j < scheduledStops.count; j += 1) {
                    scheduledStop = [scheduledStops objectAtIndex:j];
                    if (![stops containsObject:scheduledStop.stop]) {
                        [stops addObject:scheduledStop.stop];
                    }
                }
                Stop *finalStop = [trip finalStop];
                if (![finalStops containsObject:finalStop]) {
                    [finalStops addObject:finalStop];
                    //NSLog(@"Adding final stop %@", finalStop.name);
                }
            }
        }
        
        NSLog(@"Found %d scheduled stops (%d final) ", stops.count, finalStops.count);
        
        recordingLocation = FALSE;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    self.navigationItem.title = [[self.detailItem valueForKey:@"name"] description];
    
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        
        if ([CLLocationManager locationServicesEnabled]) {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            [locationManager startUpdatingLocation];
        }
    }
    
    if (mapView && !finalStopAnnotations) {
        finalStopAnnotations = [[NSMutableArray alloc] initWithObjects: nil];
        NSArray *finalStopsArray = [finalStops allObjects];
        for (NSInteger i = 0; i < finalStopsArray.count; i += 1) {
            Stop *finalStop = [finalStopsArray objectAtIndex:i];
            CLLocationCoordinate2D finalStopLocation = CLLocationCoordinate2DMake(finalStop.latitudeValue, finalStop.longitudeValue);
            PBFinalStopAnnotation *stopAnnotation = [[PBFinalStopAnnotation alloc] initWithTitle:finalStop.name andCoordinate:finalStopLocation];
            [mapView addAnnotation:stopAnnotation];
            [finalStopAnnotations addObject: stopAnnotation];
        }
    }

    [self updateMapRegionForStops:[stops allObjects]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [mapView setDelegate:self];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - LocationManager Delegate

- (void) locationManager:(CLLocationManager *)manager 
     didUpdateToLocation:(CLLocation *)newLocation 
            fromLocation:(CLLocation *)oldLocation
{
    //NSLog(@"Updated location");
    
    currentLocation = newLocation;
    
    if (!recordingLocation) {
        return;
    }
        
    if (!crumbs) {
        crumbs = [[CrumbPath alloc] initWithCenterCoordinate:newLocation.coordinate];
        [mapView addOverlay:crumbs];
    } else {
        MKMapRect updateRect = [crumbs addCoordinate:newLocation.coordinate];
        
        if (!MKMapRectIsNull(updateRect))
        {
            // There is a non null update rect.
            // Compute the currently visible map zoom scale
            MKZoomScale currentZoomScale = (CGFloat)(mapView.bounds.size.width / mapView.visibleMapRect.size.width);
            // Find out the line width at this zoom scale and outset the updateRect by that amount
            CGFloat lineWidth = MKRoadWidthAtZoomScale(currentZoomScale);
            updateRect = MKMapRectInset(updateRect, -lineWidth, -lineWidth);
            // Ask the overlay view to update just the changed area.
            [crumbView setNeedsDisplayInMapRect:updateRect];
            walkableStops.currentLocation = newLocation;
            [walkableStopsView setNeedsDisplayInMapRect:walkableStops.boundingMapRect];
        }
        
        //[self updateMapRegionIfRequired];
    }
}

/**
 * We want to keep the whole trail within view, but without unnecessarily scrolling or scaling the map view.
 *
 */

- (void) updateMapRegionIfRequired
{
    // What the map is currently showing
    MKCoordinateRegion currentRegion = [mapView region];
    CLLocationCoordinate2D center = currentRegion.center;
    MKCoordinateSpan span = currentRegion.span;
    
    
    // What we need to be visible, and near the center, not too small.
    MKCoordinateRegion trailRegion = [crumbs region];
    double scale = 1.2;
    CLLocationDegrees maxDelta = fmax(trailRegion.span.longitudeDelta, trailRegion.span.latitudeDelta);
    if (maxDelta < MIN_DELTA_DEGREES) {
        if (maxDelta == 0) {
            trailRegion.span.longitudeDelta = MIN_DELTA_DEGREES;
            trailRegion.span.latitudeDelta = MIN_DELTA_DEGREES;
        } else {
            scale = MIN_DELTA_DEGREES / maxDelta;
        }
    }
    trailRegion.span.longitudeDelta *= scale;
    trailRegion.span.latitudeDelta *= scale;
    
    // We will zoom if any of the for extremeties of the desired regions fall outside the relevant quadrants of the displayed region.
    CLLocationDegrees trailTop, trailBottom, trailLeft, trailRight, frameTop, frameBottom, frameLeft, frameRight;
    trailTop    = trailRegion.center.latitude  + trailRegion.span.latitudeDelta  * 0.5;
    trailBottom = trailRegion.center.latitude  - trailRegion.span.latitudeDelta  * 0.5;
    trailLeft   = trailRegion.center.longitude - trailRegion.span.longitudeDelta * 0.5;
    trailRight  = trailRegion.center.longitude + trailRegion.span.longitudeDelta * 0.5;
    
    frameTop    = center.latitude  + span.latitudeDelta  * 0.5;
    frameBottom = center.latitude  - span.latitudeDelta  * 0.5;
    frameRight  = center.longitude + span.longitudeDelta * 0.5;
    frameLeft   = center.longitude - span.longitudeDelta * 0.5;
    
    if (trailTop    > frameTop    || trailTop    < center.latitude  ||
        trailBottom < frameBottom || trailBottom > center.latitude  ||
        trailRight  > frameRight  || trailRight  < center.longitude ||
        trailLeft   < frameLeft   || trailLeft   > center.longitude) {
        
#if 0
        NSLog(@"Need to setRegion:");
        NSLog(@"Top: %.5f %.5f", trailTop - center.latitude, frameTop - trailTop); 
        NSLog(@"Bottom: %0.5f %0.5f", center.latitude - trailBottom, trailBottom - frameBottom); 
        NSLog(@"Left: %0.5f %0.5f",  center.longitude - trailLeft, trailLeft - frameLeft); 
        NSLog(@"Right: %0.5f %0.5f", trailRight - center.longitude, frameRight - trailRight); 
#endif
        
        [mapView setRegion:trailRegion animated:YES];
    }
}

- (void) updateMapRegionForStops:(NSArray *) visibleStops
{
    
    Stop *stop = [visibleStops objectAtIndex:0];
    
    CLLocationDegrees minX, maxX, minY, maxY;
    minX = maxX = stop.longitudeValue;
    minY = maxY = stop.latitudeValue;
    
    for (NSInteger i = 0; i < visibleStops.count; i++) {
        stop = [visibleStops objectAtIndex:i];
        minX = MIN(minX, stop.longitudeValue);
        maxX = MAX(maxX, stop.longitudeValue);
        minY = MIN(minY, stop.latitudeValue);
        maxY = MAX(maxY, stop.latitudeValue);
        //NSLog(@"Including stop at %.4f %.4f", stop.latitudeValue, stop.longitudeValue);
    }
    
    //NSLog(@"Latitude: %.4f .. %.2f   Longitude: %.4f .. %.4f", minY, maxY, minX, maxX);

    CLLocationCoordinate2D a = CLLocationCoordinate2DMake(minY, minX);
    CLLocationCoordinate2D b = CLLocationCoordinate2DMake(maxY, maxX);
    MKMapPoint ma = MKMapPointForCoordinate(a);
    MKMapPoint mb = MKMapPointForCoordinate(b);
    MKMapRect mapRect = MKMapRectMake(ma.x, mb.y, fabs(mb.x - ma.x), fabs(mb.y - ma.y));        
    MKCoordinateRegion stopsRegion = MKCoordinateRegionForMapRect(mapRect);
    
    
    // Scale the region out to include a bit more.
    double scale = 1.2;
    CLLocationDegrees maxDelta = fmax(stopsRegion.span.longitudeDelta, stopsRegion.span.latitudeDelta);
    if (maxDelta < MIN_DELTA_DEGREES) {
        if (maxDelta == 0) {
            stopsRegion.span.longitudeDelta = MIN_DELTA_DEGREES;
            stopsRegion.span.latitudeDelta = MIN_DELTA_DEGREES;
        } else {
            scale = MIN_DELTA_DEGREES / maxDelta;
        }
    }
    stopsRegion.span.longitudeDelta *= scale;
    stopsRegion.span.latitudeDelta *= scale;
                
    [mapView setRegion:stopsRegion animated:YES];
    
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    NSLog(@"Region will change");
    if (tripMapView) {
        [tripMapView setNeedsDisplayInMapRect:tripMap.boundingMapRect];
    }
}


- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[PBTripMap class]]) {
        if (!tripMapView) {
            tripMapView = [[PBTripMapView alloc] initWithOverlay:overlay];
        }
        return tripMapView;
    }
    
    
    if ([overlay isKindOfClass:[PBWalkableStops class]]) {
        if (!walkableStopsView) {
            walkableStopsView = [[PBWalkableStopsView alloc] initWithOverlay:overlay];
        }
        return walkableStopsView;
    }
    
    if ([overlay isKindOfClass:[CrumbPath class]]) {
        if (!crumbView)
        {
            crumbView = [[CrumbPathView alloc] initWithOverlay:overlay];
        }
        return crumbView;
    }

    NSLog(@"Error no matching overlay class.");
    return nil;
}

- (MKAnnotationView *)mapView:(MKMapView *)mv
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[PBFinalStopAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView* pinView = (MKPinAnnotationView*)[mv dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotation"];
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:
                                     UIButtonTypeContactAdd];
            //[rightButton addTarget:self action:@selector(annotationCallout:)
            //      forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
            pinView.annotation = annotation;
        }
        else
            pinView.annotation = annotation;
        return pinView;
    }
    return nil; 
}

- (void)mapView:(MKMapView *)mv annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    //NSLog(@"Annotation callout!");
    
    NSArray *potentialTrips = [filteredTrips allObjects];
    Trip *trip;
    for (NSInteger i = 0; i < potentialTrips.count; i += 1) {
        trip = [potentialTrips objectAtIndex:i];
        CLLocationCoordinate2D finalStopLocation = CLLocationCoordinate2DMake(trip.finalStop.latitudeValue, trip.finalStop.longitudeValue);
        PBFinalStopAnnotation *annotation = view.annotation;
        if (fabs(annotation.coordinate.latitude - finalStopLocation.latitude) > MAX_DEGREES_NEARBY_STOP || 
            fabs(annotation.coordinate.longitude - finalStopLocation.longitude) > MAX_DEGREES_NEARBY_STOP) {
            [filteredTrips removeObject:trip];
            [finalStops removeObject:trip.finalStop];
        }
    }
    
    //NSLog(@"Found %d scheduled stops (%d final) for %d trips", stops.count, finalStops.count, filteredTrips.count);

    
    
    potentialTrips = [filteredTrips allObjects];
    Trip *nextTrip;
    NSTimeInterval nextArrival = 100000;
    if (potentialTrips.count > 0) {
        trip = [potentialTrips objectAtIndex:0];
        Stop *closestStop = [trip closestStopTo:currentLocation];
        NSLog(@"Closest stop at %@", closestStop.name);
        for (NSInteger i = 0; i < potentialTrips.count; i += 1) {
            trip = [potentialTrips objectAtIndex:i];
            ScheduledStop *scheduledStop = [trip scheduledStopFor:closestStop];
            NSTimeInterval secondsUntilDeparture = [scheduledStop secondsUntilDeparture];
            if (secondsUntilDeparture > 60 && secondsUntilDeparture < nextArrival) {
                nextTrip = trip;
                nextArrival = [scheduledStop secondsUntilDeparture];
                NSLog(@"Seconds until departure: %.2f", [scheduledStop secondsUntilDeparture]);
            }
        }
        tripMap = [[PBTripMap alloc] initWithTrip:nextTrip];
        walkableStops = [[PBWalkableStops alloc] initWithTrip:trip];
        [mapView addOverlay:walkableStops];
    }
    
    [mapView removeAnnotations: finalStopAnnotations];
    
    recordingLocation = TRUE;
}
    
@end
