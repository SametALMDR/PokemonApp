//
//  PokemonDetailPresenter.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation

final class PokemonDetailPresenter {

    // MARK: - Properties

    private unowned let view: PokemonDetailVCProtocol
    private let interactor: PokemonDetailInteractorProtocol

    // MARK: - Initializer

    init(
        view: PokemonDetailVCProtocol,
        interactor: PokemonDetailInteractorProtocol
    ) {
        self.view = view
        self.interactor = interactor

        self.interactor.delegate = self
    }
}

// MARK: - PokemonDetailPresenterProtocol

extension PokemonDetailPresenter: PokemonDetailPresenterProtocol {

    func load() {
        interactor.load()
    }
}

// MARK: - PokemonDetailInteractorDelegate

extension PokemonDetailPresenter: PokemonDetailInteractorDelegate {

    func handleOutput(_ output: PokemonDetailInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showDetail(let pokemonDetailPresentation):
            view.handleOutput(.showDetail(pokemonDetailPresentation))
        }
    }
}
