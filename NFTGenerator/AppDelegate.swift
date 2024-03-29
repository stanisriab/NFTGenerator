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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            do {
                let destination = try FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                
                print(Date().debugDescription)
                let configs = try loadConfig().generateImageConfigs(count: 10000)
                print(Date().debugDescription)
                print(configs)
//                try loadAssets()
//                    .generateImagesProperties(count: 500)
//                    .filterDuplicates()
//                    .compactMap { $0.generateCIImage() }
//                    .forEach { saveCIImageToJpeg($0.0, to: destination) }
            } catch {
                print(error)
            }
        }
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

enum AssetConfig: String {
    case `default` = "Config"
}

func loadConfig(config: AssetConfig = .default) throws -> [ConfigElement] {
    guard let urlPath = Bundle.main.url(forResource: config.rawValue, withExtension: "json") else {
        throw "Not found config file"
    }
    
    return try JSONDecoder().decode([ConfigElement].self, from: .init(contentsOf: urlPath))
}

//func loadAssets(with config: AssetConfig = .default) throws -> [[Asset]] {
//    guard let urlPath = Bundle.main.url(forResource: config.rawValue, withExtension: "json") else {
//        throw "Not found config file"
//    }
//
//    let configNames = try JSONDecoder().decode([ConfigElement].self, from: .init(contentsOf: urlPath))
//
//    return try configNames
//        .compactMap { Bundle.main.url(forResource: $0, withExtension: "json") }
//        .compactMap { try JSONDecoder().decode([Asset].self, from: .init(contentsOf: $0)) }
//}

func saveToDisk() {
    // 1. save image
    // 2. generate json
    // 3. save json
}

let queue = DispatchQueue(label: "queue", attributes: .concurrent, autoreleaseFrequency: .workItem, target: .global(qos: .userInteractive))

func saveCIImageToJpeg(_ image: CIImage, to path: URL) {
    queue.async {
            let representation = NSBitmapImageRep(ciImage: image)
            let data = representation.representation(using: .jpeg, properties: [:])
            var path = path
            path.appendPathComponent(UUID().uuidString)
            path.appendPathExtension("jpeg")
            try? data?.write(to: path)
            print(Date().debugDescription)
    }
}

