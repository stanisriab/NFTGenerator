//
//  AssetRarity.swift
//  NFTGenerator
//
//  Created by Ash Censo on 23.10.2022.
//

import Foundation

enum AssetRarity: String, AnyModel, Hashable {
    case common
    case rare
    case mystical
    case legendary
    
    var rarity: Int {
        switch self {
        case .common: return 1000
        case .rare: return 600
        case .mystical: return 350
        case .legendary: return 50
        }
    }
}
