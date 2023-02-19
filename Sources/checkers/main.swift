import Cocoa
import Foundation
import CoreGraphics
import AppKit

// let the app run in the background with a timer going off every 5 seconds to take a screenshot

// let gameWatcher = GameWatcher()
// let timer = Timer.scheduledTimer(timeInterval: 5, target: gameWatcher, selector: #selector(GameWatcher.currentgame), userInfo: nil, repeats: true)
// RunLoop.current.add(timer, forMode: .common)

let drawTransparentWindow = DrawGrid()



class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
    drawTransparentWindow.transparentWindow()
    // kill app when any key is pressed
    NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { _ in
        NSApp.terminate(nil)
        



    }
    }
}
let delegate = AppDelegate()
let app = NSApplication.shared
app.delegate = delegate
app.activate(ignoringOtherApps: false)


app.run()



