//
//  APIEnv.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation

enum APIEnv {
    case development
    case production

    static let current: Self = .development

    var baseUrl: String {
        switch self {
        case .development:
            return "https://pokeapi.co/api/v2/"
        case .production:
            return "https://pokeapi.co/api/v2/"
        }
    }
}
