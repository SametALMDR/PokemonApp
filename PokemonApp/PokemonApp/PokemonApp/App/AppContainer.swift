//
//  AppContainer.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation
import PokemonAppAPI

let app = AppContainer()

final class AppContainer {

    let router = AppRouter()
    lazy var pokemonService = PokemonService()
}
