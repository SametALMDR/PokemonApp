//
//  PokemonDetailPresentation.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation
import struct PokemonAppAPI.PokemonDetailResponse

struct PokemonDetailPresentation {
    let name: String?
    let imageUrl: String?
    var abilities: [String]?

    init(pokemonDetailResponse: PokemonDetailResponse) {
        self.name = pokemonDetailResponse.name
        self.imageUrl = pokemonDetailResponse.sprites?.imageUrl
        self.abilities = pokemonDetailResponse.abilities?.compactMap({ $0.ability.name })
    }
}
