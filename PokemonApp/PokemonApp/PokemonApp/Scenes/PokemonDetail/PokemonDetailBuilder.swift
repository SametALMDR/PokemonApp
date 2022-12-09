//
//  PokemonDetailBuilder.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import UIKit

final class PokemonDetailBuilder {

    static func make(with pokemonName: String) -> PokemonDetailVC {
        let view = PokemonDetailVC.initFromNib()
        let interactor = PokemonDetailInteractor(
            service: app.pokemonService,
            pokemonName: pokemonName)
        let presenter = PokemonDetailPresenter(
            view: view,
            interactor: interactor)
        view.presenter = presenter
        return view
    }
}
