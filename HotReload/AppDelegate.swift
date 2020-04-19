//
//  AppDelegate.swift
//  HotReload
//
//  Created by Manuel on 19/04/20.
//  Copyright © 2020 manuelbulos. All rights reserved.
//

import Cocoa
import SwiftUI
import FileWatcher

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        startObservingFolderChanges()
    }

    func startObservingFolderChanges() {
        let filewatcher = FileWatcher([NSString(string: "~/Documents/Projects").expandingTildeInPath])
        filewatcher.callback = { event in
            print("Something happened here: \(event.path)")
            print("event.description:  \(event.description)")
            print("event.flags:  \(event.flags)")

            if let error = ScriptWizard.run(script: .reload(.chrome)) {
                print(error.description)
            }
        }
        filewatcher.start()
    }
}

