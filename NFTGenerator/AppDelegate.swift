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
        try? loadAssets()
            .generateImagesProperties(count: 100)
            .filterDuplicates()
            .compactMap { $0.generateCIImage() }
            .forEach { tuple in
                let (image, assets) = tuple
                print(image)
                print(assets)
            }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

enum AssetConfig: String {
    case `default` = "Config"
}

func loadAssets(with config: AssetConfig = .default) throws -> [[Asset]] {
    guard let urlPath = Bundle.main.url(forResource: config.rawValue, withExtension: "json") else {
        throw "Not found config file"
    }
    
    let configNames = try JSONDecoder().decode([String].self, from: .init(contentsOf: urlPath))
    
    return try configNames
        .compactMap { Bundle.main.url(forResource: $0, withExtension: "json") }
        .compactMap { try JSONDecoder().decode([Asset].self, from: .init(contentsOf: $0)) }
}


func saveToDisk() {
    // 1. save image
    // 2. generate json
    // 3. save json
}
