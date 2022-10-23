//
//  Tags.swift
//  NFTGenerator
//
//  Created by Ash Censo on 23.10.2022.
//

import Foundation

struct Tags: AnyModel, Hashable {
    let own: [Tag]
    let pairs: [Tag]
    let unpairs: [Tag]
}
