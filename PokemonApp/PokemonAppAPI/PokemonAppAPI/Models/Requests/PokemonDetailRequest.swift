//
//  PokemonDetailRequest.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation

struct PokemonDetailRequest: BaseRequestProtocol {
    var path: String = "pokemon/%@"
}
