//
//  AppDelegate.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Cocoa
import Foundation

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print(Date().debugDescription)
        
        do {
            let destination = try FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
            print(destination)
            
            try loadAssets()
                .generateImagesProperties(count: 500)
                .filterDuplicates()
                .compactMap { $0.generateCIImage() }.forEach {
                    try saveCIImageToJpeg($0.0, to: destination)
                }
        } catch {
            print(error)
        }
        
        print(Date().debugDescription)
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

func saveCIImageToJpeg(_ image: CIImage, to path: URL) throws {
    try autoreleasepool {
        let representation = NSBitmapImageRep.init(ciImage: image)
        let data = representation.representation(using: .jpeg, properties: [:])
        var path = path
        path.appendPathComponent(UUID().uuidString)
        path.appendPathExtension("jpeg")
        try data?.write(to: path)
    }
}

