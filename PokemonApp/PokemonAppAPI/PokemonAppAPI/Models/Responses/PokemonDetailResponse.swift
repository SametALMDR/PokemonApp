//
//  PokemonDetailResponse.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation

public struct PokemonDetailResponse: BaseResponseProtocol {

    public let abilities: [PokemonAbility]?
    public let name: String?
    public let sprites: PokemonSprites?
}
