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

@interface PBDetailViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

{
@private 
    CrumbPath *crumbs;
    CrumbPathView *crumbView;
    BOOL recordingLocation;
    NSMutableSet *stops;
}

@property (strong, nonatomic) Route *detailItem;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong) CLLocationManager *locationManager;
@property (strong) CLLocation *currentLocation;

- (void) updateMapRegionIfRequired;
- (void) updateMapRegionForStops:(NSArray *) visibleStops;

@end
