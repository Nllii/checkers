#include <ApplicationServices/ApplicationServices.h>
#include <AppKit/AppKit.h>


void moveMouseWithEasing(int x, int y) {
    // Get current mouse location
    CGEventRef event = CGEventCreate(NULL);
    CGPoint currentMouseLocation = CGEventGetLocation(event);
    CFRelease(event);

    // Calculate distance to move
    CGPoint targetLocation = CGPointMake(x, y);
    CGPoint distance = CGPointMake(targetLocation.x - currentMouseLocation.x, targetLocation.y - currentMouseLocation.y);

    // Set up the animation timer
    CGFloat duration = 0.5;  // in seconds
    NSInteger steps = 60;  // number of animation steps
    CGFloat stepSizeX = distance.x / steps;
    CGFloat stepSizeY = distance.y / steps;

    // Animate the mouse movement
    for (NSInteger i = 0; i < steps; i++) {
        CGFloat progress = (CGFloat)i / (CGFloat)steps;
        CGFloat easeValue = sin(progress * M_PI_2);

        CGPoint intermediateLocation = CGPointMake(currentMouseLocation.x + stepSizeX * i, currentMouseLocation.y + stepSizeY * i);
        CGPoint easedLocation = CGPointMake(currentMouseLocation.x + distance.x * easeValue, currentMouseLocation.y + distance.y * easeValue);

        CGEventRef move = CGEventCreateMouseEvent(NULL, kCGEventMouseMoved, easedLocation, kCGMouseButtonLeft);
        CGEventPost(kCGHIDEventTap, move);
        CFRelease(move);

        // Sleep for the duration of a single frame
        [NSThread sleepForTimeInterval:duration / steps];
    }

    // Move the mouse to the final destination
    CGEventRef move = CGEventCreateMouseEvent(NULL, kCGEventMouseMoved, targetLocation, kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, move);
    CFRelease(move);
}