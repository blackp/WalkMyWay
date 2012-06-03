//
//  PBDetailViewController.h
//  WalkMyWay
//
//  Created by Philip Blackwell on 1/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>
#import "ModelTypes.h"
#import "CrumbPath.h"
#import "CrumbPathView.h"
#import "PBTripMap.h"
#import "PBTripMapView.h"
#import "PBWalkableStops.h"
#import "PBWalkableStopsView.h"

@interface PBDetailViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

{
@private 
    CrumbPath *crumbs;
    CrumbPathView *crumbView;
    PBTripMap *tripMap;
    PBTripMapView *tripMapView;
    PBWalkableStops *walkableStops;
    PBWalkableStopsView *walkableStopsView;
    BOOL recordingLocation;
    NSMutableSet *stops;
    NSMutableSet *finalStops;
    NSMutableArray *finalStopAnnotations;
    NSMutableSet *filteredTrips; // All the trips that haven't been filtered out by user selection of final stops
}

@property (strong, nonatomic) Route *detailItem;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong) CLLocationManager *locationManager;
@property (strong) CLLocation *currentLocation;

- (void) updateMapRegionIfRequired;
- (void) updateMapRegionForStops:(NSArray *) visibleStops;

@end
