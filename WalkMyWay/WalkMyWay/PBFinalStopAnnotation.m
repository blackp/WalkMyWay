//
//  PBFinalStopAnnotation.m
//  WalkMyWay
//
//  Created by Philip Blackwell on 2/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import "PBFinalStopAnnotation.h"

@implementation PBFinalStopAnnotation

@synthesize title, coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	self = [super init];
	title = ttl;
	coordinate = c2d;
	return self;
}

- (void)dealloc {

}

@end
