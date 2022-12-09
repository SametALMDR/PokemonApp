//
//  Decoders.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation

public enum Decoders {

    public static let baseDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}
