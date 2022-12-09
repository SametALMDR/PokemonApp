//
//  PokemonsResponse.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation

public struct PokemonsResponse: BaseResponseProtocol {

    public let results: [Pokemon]?
}
