//
//  PBFinalStopAnnotation.h
//  WalkMyWay
//
//  Created by Philip Blackwell on 2/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PBFinalStopAnnotation : NSObject <MKAnnotation> {

    NSString *title;
    CLLocationCoordinate2D coordinate;

}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d;

@end
