//
//  PBWalkableStopsView.m
//  WalkMyWay
//
//  Created by Philip Blackwell on 2/06/12.
//  Copyright (c) 2012 Cordelta. All rights reserved.
//

#import "PBWalkableStopsView.h"
#import "PBWalkableStops.h"

@interface PBWalkableStopsView (FileInternal)
- (CGPathRef)newPathForPoints:(MKMapPoint *)points
                   pointCount:(NSUInteger)pointCount
                     clipRect:(MKMapRect)mapRect
                    zoomScale:(MKZoomScale)zoomScale;
@end

@implementation PBWalkableStopsView

- (void)drawMapRect:(MKMapRect)mapRect
          zoomScale:(MKZoomScale)zoomScale
          inContext:(CGContextRef)context
{
    //NSLog(@"Draw Walkable Stops at scale %f", zoomScale);
    
    PBWalkableStops *walkableStops = (PBWalkableStops *)(self.overlay);
    
    CGFloat lineWidth = MKRoadWidthAtZoomScale(zoomScale) * 0.5;
    
    // outset the map rect by the line width so that points just outside
    // of the currently drawn rect are included in the generated path.
    MKMapRect clipRect = MKMapRectInset(mapRect, -lineWidth, -lineWidth);
        
    CGPathRef easyStopsPath = [self newPathForPoints:[walkableStops stopsEasy]
                                          pointCount:[walkableStops stopCountEasy]
                                            clipRect:clipRect
                                           zoomScale:zoomScale];
    CGPathRef mediumStopsPath = [self newPathForPoints:[walkableStops stopsMedium]
                                            pointCount:[walkableStops stopCountMedium]
                                              clipRect:clipRect
                                             zoomScale:zoomScale];
    CGPathRef hardStopsPath = [self newPathForPoints:[walkableStops stopsHard]
                                          pointCount:[walkableStops stopCountHard]
                                            clipRect:clipRect
                                           zoomScale:zoomScale];
    
    if (easyStopsPath != nil || mediumStopsPath != nil || hardStopsPath != nil)
    {
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, lineWidth);
        
        if (easyStopsPath != nil) {
            CGContextAddPath(context, easyStopsPath);
            CGContextSetRGBStrokeColor(context, 0.0f, 1.0f, 0.0f, 1.5f);
            CGContextStrokePath(context);
            CGPathRelease(easyStopsPath);
        }
        
        if (mediumStopsPath != nil) {
            CGContextAddPath(context, mediumStopsPath);
            CGContextSetRGBStrokeColor(context, 1.0f, 0.8f, 0.0f, 1.5f);
            CGContextStrokePath(context);
            CGPathRelease(mediumStopsPath);
        }
        
        if (hardStopsPath != nil) {
            CGContextAddPath(context, hardStopsPath);
            CGContextSetRGBStrokeColor(context, 1.0f, 0.0f, 0.0f, 1.5f);
            CGContextStrokePath(context);
            CGPathRelease(hardStopsPath);
        }
    }
}

@end

@implementation PBWalkableStopsView (FileInternal)

//static BOOL lineIntersectsRect(MKMapPoint p0, MKMapPoint p1, MKMapRect r)
//{
//    double minX = MIN(p0.x, p1.x);
//    double minY = MIN(p0.y, p1.y);
//    double maxX = MAX(p0.x, p1.x);
//    double maxY = MAX(p0.y, p1.y);
//    
//    MKMapRect r2 = MKMapRectMake(minX, minY, maxX - minX, maxY - minY);
//    return MKMapRectIntersectsRect(r, r2);
//}

- (CGPathRef)newPathForPoints:(MKMapPoint *)points
                   pointCount:(NSUInteger)pointCount
                     clipRect:(MKMapRect)mapRect
                    zoomScale:(MKZoomScale)zoomScale
{
    //NSLog(@"Path of %d circles", pointCount);
    
    if (pointCount < 2)
        return NULL;
    
    CGMutablePathRef path = NULL;
    
    CGFloat circleRadius = MKRoadWidthAtZoomScale(zoomScale);

    MKMapPoint point;    
    
    NSUInteger i;
    for (i = 1; i < pointCount - 1; i++)
    {
        point = points[i];
        CGPoint cgPoint = [self pointForMapPoint:point];
        MKMapRect rect = MKMapRectMake(point.x, point.y, circleRadius, circleRadius);
        CGRect cgRect = [self rectForMapRect:rect];
        if (!path) 
        {
            path = CGPathCreateMutable();
        }
        
        CGPathMoveToPoint(path, NULL, cgPoint.x + cgRect.size.width * 0.5, cgPoint.y);
        CGPathAddArc(path, NULL, cgPoint.x, cgPoint.y, cgRect.size.width * 0.5, 0.0, -0.1, 0);
        //CGPathAddRect(path, NULL, cgRect);
    }

    //NSLog(@"New path for %d points at scale %f", pointCount, zoomScale);
    return path;
}


@end
