//
//  PokemonSprites.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation

public struct PokemonSprites: Codable {

    public let imageUrl: String

    private enum CodingKeys: String, CodingKey {
        case imageUrl = "front_default"
    }
}
