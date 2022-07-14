//
//  Asset.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Foundation

struct Asset: AnyModel, Hashable {
    let resourceName: String
    let resourceType: String
    let tags: [String]
    let rarity: Int
    let type: AssetType
    let layer: Int
}

extension Asset {
    enum AssetType: String, AnyModel, Hashable {
        case body
        case accessory
        case cloth
        case eye
        case hand
        case head
        case mouth
        case wings
        case background
    }
}


struct CollectionAsset {
    
}

//{
//    "name": "YOUR COLLECTION NAME #5",
//    "description": "Remember to replace this description",
//    "file_url": "ipfs://NewUriToReplace/5.png",
//    "image": "ipfs://NewUriToReplace/5.png",
//    "attributes": [
//        {
//            "trait_type": "Background",
//            "value": "Yellow"
//        },
//        {
//            "trait_type": "Eyeball",
//            "value": "White"
//        },
//        {
//            "trait_type": "Eye color",
//            "value": "Yellow"
//        },
//        {
//            "trait_type": "Iris",
//            "value": "Large"
//        },
//        {
//            "trait_type": "Shine",
//            "value": "Shapes"
//        },
//        {
//            "trait_type": "Bottom lid",
//            "value": "Low"
//        },
//        {
//            "trait_type": "Top lid",
//            "value": "Middle"
//        }
//    ],
//    "custom_fields": {
//        "dna": "cf54b34510eea2b9b26b41ae69fd40d7bbb993a5",
//        "edition": 5,
//        "date": 1656947593908,
//        "compiler": "HashLips Art Engine - codeSTACKr Modified"
//    },
//    "external_url": "https://codecats.xyz"
//}
