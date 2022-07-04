//
//  LoadService.swift
//  NFTGenerator
//
//  Created by Ash Censo on 04.07.2022.
//

import Foundation

protocol AnyLoadAssetsService {
    
}

enum AssetConfig: String {
    case `default` = "Config"
}

final class LoadAssetsService: AnyLoadAssetsService {
    func loadAssets(with config: AssetConfig = .default) throws -> [[Asset]] {
        guard let urlPath = Bundle.main.url(forResource: config.rawValue, withExtension: "json") else {
            throw "Not found config file"
        }
        
        let configNames = try JSONDecoder().decode([String].self, from: .init(contentsOf: urlPath))
        
        return try configNames
            .compactMap { Bundle.main.url(forResource: $0, withExtension: "json") }
            .compactMap { try JSONDecoder().decode([Asset].self, from: .init(contentsOf: $0)) }
    }
}
