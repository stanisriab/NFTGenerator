//
//  Attributes.swift
//  NFTGenerator
//
//  Created by Ash Censo on 23.10.2022.
//

import Foundation

struct Attributes: AnyModel, Hashable {
    let attributesClass: String
    let attributesSet: String
    let colorScheme: String
    let rarity: String
    let type: String
    let name: String
}
