//
//  AppDelegate.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print(Date().debugDescription)
        let assets = try? LoadAssetsService.init().loadAssets()
        
        let some = ImagePropertiesGenerator.init(with: assets ?? []).generateImagesProperties(count: 10000)
        
        print(Date().debugDescription)
        print(some)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

extension URL {
    func subDirectories() throws -> [URL] {
        // @available(macOS 10.11, iOS 9.0, *)
        guard hasDirectoryPath else { return [] }
        return try FileManager.default.contentsOfDirectory(at: self, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]).filter(\.hasDirectoryPath)
    }
}
