import Foundation
import AppKit

class GameWatcher {
    func getWindows() -> [CGWindowID] {
        let windowListInfo = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID) as! [[String: AnyObject]]
        for window in windowListInfo {
            if let windowName = window[kCGWindowName as String] as? String {
                if "checkers" == windowName.lowercased() {
                    print("found a running window ", windowName)
                    let windowID = window[kCGWindowNumber as String] as! CGWindowID
                    return [windowID]
                }
            }
        }
        return []
    }

    //  create a function that will take a screenshot of a window and save it to a file
    func screenshot(windowID: CGWindowID, folderName: String) {
        let image = CGWindowListCreateImage(CGRect.null, .optionIncludingWindow, windowID, [.boundsIgnoreFraming, .nominalResolution])
        let rep = NSBitmapImageRep(cgImage: image!)
        let data = rep.representation(using: .png, properties: [:])
        let url = URL(fileURLWithPath: folderName + "\(windowID).png")
        try! data!.write(to: url)
    }

    //  create a function that will take a screenshot of the entire screen and save it to a file
    @objc func currentgame() {
        let currentWindows = getWindows()
        print("Getting current game")       
        for window in currentWindows {
            screenshot(windowID: window, folderName: "./currentGame/")
        }
    }
}

// let gameWatcher = GameWatcher()
// let timer = Timer.scheduledTimer(timeInterval: 5, target: gameWatcher, selector: #selector(GameWatcher.currentgame), userInfo: nil, repeats: true)
