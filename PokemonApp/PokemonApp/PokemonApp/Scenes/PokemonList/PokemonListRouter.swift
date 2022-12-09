//
//  PokemonListRouter.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import UIKit

final class PokemonListRouter {

    // MARK: - Properties

    unowned let view: UIViewController

    // MARK: - Initializer

    init(view: UIViewController) {
        self.view = view
    }
}

// MARK: - PokemonListRouterProtocol

extension PokemonListRouter: PokemonListRouterProtocol {

    func navigate(to route: PokemonListRoute) {
        switch route {
        case .detail(pokemonName: let name):
            let detailView = PokemonDetailBuilder.make(with: name)
            view.show(detailView, sender: nil)
        }
    }
}
