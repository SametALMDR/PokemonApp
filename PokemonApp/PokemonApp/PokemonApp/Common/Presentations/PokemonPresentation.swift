//
//  PokemonPresentation.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation
import struct PokemonAppAPI.Pokemon

struct PokemonPresentation {
    let name: String?
    let imageUrl: String?

    init(pokemon: Pokemon) {
        self.name = pokemon.name
        self.imageUrl = pokemon.imageUrl
    }
}
