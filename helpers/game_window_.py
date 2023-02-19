#!/usr/bin/python
# Prints list of windows in the current workspace.
import sys
import os
window_names  = ["flyordie","playok","OpenCV for Mac Catalina"]
# we have to be explicit about getting the window names.
#!/usr/bin/python
# Prints list of windows in the current workspace.
import sys
if sys.platform == "darwin":
    from AppKit import NSWorkspace
    from Quartz import (
        CGWindowListCopyWindowInfo,
        kCGWindowListOptionOnScreenOnly,
        kCGNullWindowID
    )

def get_window_names():
    window_names = []
    window_list = CGWindowListCopyWindowInfo(
        kCGWindowListOptionOnScreenOnly, kCGNullWindowID)
    for window in window_list:
        print(window)

    #     window_name = window.get("kCGWindowName")
    #     if window_name:
    #         window_names.append(window_name)
    # return window_names
# get_window_names()