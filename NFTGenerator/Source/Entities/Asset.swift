//
//  Asset.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Foundation

struct Asset: AnyModel {
    let resourceName: String
    let resourceType: String
    let tags: [String]
    let rarity: Int
    let type: AssetType
    let layer: Int
}

extension Asset {
    enum AssetType: String, AnyModel {
        case body
        case accessory
        case cloth
        case eye
        case hand
        case head
        case mouth
        case wings
    }
}
