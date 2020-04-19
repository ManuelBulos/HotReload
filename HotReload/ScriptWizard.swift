//
//  ScriptWizard.swift
//  HotReload
//
//  Created by Manuel on 19/04/20.
//  Copyright © 2020 manuelbulos. All rights reserved.
//

import Foundation

class ScriptWizard {
    enum Browser {
        case chrome
        case safari

        var scriptPath: URL {
            switch self {
                case .chrome:
                    return Bundle.main.url(forResource: "chrome_reload", withExtension: "scpt")!
                case .safari:
                    return Bundle.main.url(forResource: "safari_reload", withExtension: "scpt")!
            }
        }
    }

    enum Script {
        case reload(Browser)

        func run() -> NSDictionary? {
            switch self {
                case .reload(let browser):
                    var error: NSDictionary?
                    NSAppleScript(contentsOf: browser.scriptPath, error: &error)?.executeAndReturnError(&error)
                    return error
            }
        }
    }

    static func run(script: Script) -> NSDictionary? {
        return script.run()
    }
}
