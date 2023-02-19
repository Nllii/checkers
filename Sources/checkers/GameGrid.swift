// Draw a transparent grid over the game board on the screen.
import Foundation
import AppKit
import CoreGraphics
import Cocoa


// class GameGrid {
//     func getWindows() -> [CGWindowID] {
//         let windowListInfo = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as! [[String: AnyObject]]
//         // print(windowListInfo)
//         for window in windowListInfo {
//             if let windowName = window[kCGWindowName as String] as? String {
//                 if "checkers" == windowName.lowercased() {
//                     print("found a running window ", windowName)
//                     let windowID = window[kCGWindowNumber as String] as! CGWindowID
//                     return [windowID]
//                 }
//             }
//         }
//         return []
//     }

//     //  create a function that will take a screenshot of a window and save it to a file
//     func screenshot(windowID: CGWindowID, folderName: String) {
//         let image = CGWindowListCreateImage(CGRect.null, .optionIncludingWindow, windowID, [.boundsIgnoreFraming, .nominalResolution])
//         let rep = NSBitmapImageRep(cgImage: image!)
//         let data = rep.representation(using: .png, properties: [:])
//         let url = URL(fileURLWithPath: folderName + "\(windowID).png")
//         try! data!.write(to: url)
//     }

//     //  create a function that will take a screenshot of the entire screen and save it to a file
//     @objc func currentgame() {
//         let currentWindows = getWindows()
//         print("Getting current game")       
//         for window in currentWindows {
//             screenshot(windowID: window, folderName: "./currentGame/")
//         }
//     }
// }


// on the screen map the game board to a 2D array
// 1. get the window ID of the game board
// 2. get the window size of the game board

// checkers is 8x8
// 1. get the window size of the game board
// 2. divide the window size by 8
// 3. draw a grid over the game board


class DrawGrid {
    func transparentWindow() {
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 752, height: 528), styleMask: [.borderless], backing: .buffered, defer: false)
        window.backgroundColor = NSColor.clear
        window.isOpaque = false
        window.level = .floating
        window.orderFrontRegardless()
        window.makeKeyAndOrderFront(nil)
        window.contentView?.wantsLayer = true
        window.contentView?.layer?.backgroundColor = NSColor.clear.cgColor
        window.contentView?.layer?.borderColor = NSColor.red.cgColor
        window.contentView?.layer?.borderWidth = 3
        window.contentView?.layer?.cornerRadius = 10
        window.contentView?.layer?.masksToBounds = true
        window.contentView?.layer?.isOpaque = false
    }


}

