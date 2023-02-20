#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "cake.h"


void printMouseLocation(void) {
    @autoreleasepool {
        NSPoint currentMouseLocation;
        NSPoint lastMouseLocation = NSZeroPoint;
        while (true) {
            currentMouseLocation = [NSEvent mouseLocation];
            if (!NSEqualPoints(currentMouseLocation, lastMouseLocation)) {
                printf("Mouse Location: (%.2f, %.2f)\n", currentMouseLocation.x, currentMouseLocation.y);
                // NSLog(@"Mouse Location: %@", NSStringFromPoint(currentMouseLocation));
                lastMouseLocation = currentMouseLocation;
            }
            [NSThread sleepForTimeInterval:0.1];
        }
    }
}
