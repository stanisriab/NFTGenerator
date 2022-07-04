//
//  ImagePropertiesGenerator.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Foundation

protocol AnyImagePropertiesGenerator {
    
}


final class ImagePropertiesGenerator: AnyImagePropertiesGenerator {
    private let assetsData: [[Asset]]
    
    init(with assetsData: [[Asset]]) {
        self.assetsData = assetsData
    }
    
    func generateImagesProperties(count: Int) -> [[Asset]] {
        (0..<count).map { _ in self.generateImageProperties() }
    }
    
    func generateImageProperties() -> [Asset] {
        assetsData.compactMap { $0.getRandomAsset() }
    }
}

extension Array where Element == Asset {
    func getRandomAsset() -> Asset? {
        let totalRarity = reduce(into: 0) { $0 += $1.rarity }
        var random = Int.random(in: 0..<totalRarity)
        
        return first {
            random -= $0.rarity
            
            if random >= 0 {
                return false
            } else {
                return true
            }
        }
    }
}
