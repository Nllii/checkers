#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <ApplicationServices/ApplicationServices.h>
#import <Quartz/Quartz.h>

CGImageRef captureWindowWithTitle(NSString *title) {
    AXUIElementRef safariApp = NULL;
    AXUIElementRef safariWindow = NULL;
    AXUIElementRef safariTab = NULL;
    CGImageRef screenshot = NULL;

    // Get a reference to the Safari application
    safariApp = AXUIElementCreateApplication((pid_t) [[NSRunningApplication        runningApplicationsWithBundleIdentifier:@"com.apple.Safari"] firstObject].processIdentifier);
    if (!safariApp) {
        NSLog(@"Could not get Safari application reference");
        return NULL;
    }

    // Get a reference to the Safari window with the specified title
    CFStringRef windowTitle = (__bridge CFStringRef) title;
    CFTypeRef attribute;
    AXUIElementCopyAttributeValue(safariApp, kAXWindowsAttribute, &attribute);
    CFIndex numWindows = CFArrayGetCount(attribute);
    for (CFIndex i = 0; i < numWindows; i++) {
        safariWindow = CFArrayGetValueAtIndex(attribute, i);
        AXUIElementCopyAttributeValue(safariWindow, kAXTitleAttribute, &attribute);
        if (CFStringCompare(attribute, windowTitle, 0) == kCFCompareEqualTo) {
            break;
        }
        safariWindow = NULL;
    }
    if (!safariWindow) {
        NSLog(@"Could not find Safari window with title: %@", title);
        CFRelease(attribute);
        CFRelease(safariApp);
        return NULL;
    }

    // Get a reference to the Safari tab
    AXUIElementCopyAttributeValue(safariWindow, kAXTabsAttribute, &attribute);
    safariTab = CFArrayGetValueAtIndex(attribute, 0);
    CFRelease(attribute);

    // Get the bounds of the Safari tab
    CGRect bounds;
    AXValueRef valueRef;
    AXUIElementCopyAttributeValue(safariTab, kAXPositionAttribute, (CFTypeRef *)&valueRef);
    AXValueGetValue(valueRef, kAXValueCGPointType, &bounds.origin);
    CFRelease(valueRef);
    AXUIElementCopyAttributeValue(safariTab, kAXSizeAttribute, (CFTypeRef *)&valueRef);
    AXValueGetValue(valueRef, kAXValueCGSizeType, &bounds.size);
    CFRelease(valueRef);

    // Take a screenshot of the Safari tab
    CGWindowID windowID;
    // CFTypeRef windowIDRef = NULL;
    // AXUIElementCopyAttributeValue(safariWindow, kAXWindowNumberAttribute, &windowIDRef);
    // CFNumberGetValue((CFNumberRef)windowIDRef, kCFNumberSInt32Type, &windowID);
    // CFRelease(windowIDRef);
    // // Cleanup
    // CFRelease(safariTab);
    // CFRelease(safariWindow);
    // CFRelease(safariApp);

    return screenshot;
}
