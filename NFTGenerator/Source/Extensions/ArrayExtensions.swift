//
//  ArrayExtensions.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Foundation
import CoreImage

extension Array: AnyModel where Element: AnyModel {}

extension Array where Element == Asset {
//    func getRandomAsset() -> Element? {
//        let totalRarity = reduce(into: 0) { $0 += $1.rarity }
//        var random = Int.random(in: 0..<totalRarity)
//
//        return first {
//            random -= $0.rarity
//
//            if random >= 0 {
//                return false
//            } else {
//                return true
//            }
//        }
//    }

//    func generateCIImage() -> (CIImage, [Element]) {
//        var resultImage: CIImage!
//
//        sorted { $0.layer < $1.layer }
//            .compactMap { Bundle.main.url(forResource: $0.resourceName, withExtension: $0.resourceType) }
//            .compactMap { CIImage(contentsOf: $0) }
//            .forEach {
//                if let image = resultImage {
//                    resultImage = CIFilter.sourceOverCompositing(
//                        inputImage: $0,
//                        inputBackgroundImage: image)?
//                        .outputImage
//                } else {
//                    resultImage = $0
//                }
//            }
//
//        return (resultImage, self)
//    }
}

extension Array where Element == [Asset] {
    func generateImagesProperties(count: Int) -> Self {
        (0..<count).map { _ in generateImageProperties() }
    }
    
//    func generateImageProperties() -> Element {
//        compactMap { $0.getRandomAsset() }
//    }
    
    func filterDuplicates() -> Self {
        Array(Set(self))
    }
}
