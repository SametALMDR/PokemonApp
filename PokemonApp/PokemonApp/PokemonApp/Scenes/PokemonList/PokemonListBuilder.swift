//
//  PokemonListBuilder.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation

final class PokemonListBuilder {

    static func make() -> PokemonListVC {
        let view = PokemonListVC.initFromNib()
        let router = PokemonListRouter(view: view)
        let interactor = PokemonListInteractor(service: app.pokemonService)
        let presenter = PokemonListPresenter(
            view: view,
            interactor: interactor,
            router: router)
        view.presenter = presenter
        return view
    }
}
