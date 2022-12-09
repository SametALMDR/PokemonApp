//
//  PokemonListPresenter.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation

final class PokemonListPresenter {

    // MARK: - Properties

    private unowned let view: PokemonListVCProtocol
    private let interactor: PokemonListInteractorProtocol
    private let router: PokemonListRouterProtocol

    // MARK: - Initializer

    init(
        view: PokemonListVCProtocol,
        interactor: PokemonListInteractor,
        router: PokemonListRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router

        self.interactor.delegate = self
    }
}

// MARK: - PokemonListPresenterProtocol

extension PokemonListPresenter: PokemonListPresenterProtocol {

    func load() {
        interactor.load()
    }

    func selectPokemon(at index: Int) {
        interactor.selectPokemon(at: index)
    }
}

// MARK: - PokemonListInteractorDelegate

extension PokemonListPresenter: PokemonListInteractorDelegate {

    func handleOutput(_ output: PokemonListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showPokemonList(let pokemonPresentations):
            view.handleOutput(.showPokemonList(pokemonPresentations))
        case .showPokemonDetail(pokemonName: let name):
            router.navigate(to: .detail(pokemonName: name))
        }
    }
}
