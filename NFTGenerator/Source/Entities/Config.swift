//
//  Config.swift
//  NFTGenerator
//
//  Created by Ash Censo on 23.10.2022.
//

import Foundation

struct ConfigElement: AnyModel {
    let name: String
    let layer: LayerOrderNumber
    let rarity: LayerRarity
}
