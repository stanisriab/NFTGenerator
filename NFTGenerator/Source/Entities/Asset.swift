//
//  Asset.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Foundation

struct Asset: AnyModel, Hashable {
    let id: String
    let resource: Resource
    let attributes: Attributes
    let tags: Tags
    let mustMatchIDS: [UniqueIdentifier]
}
