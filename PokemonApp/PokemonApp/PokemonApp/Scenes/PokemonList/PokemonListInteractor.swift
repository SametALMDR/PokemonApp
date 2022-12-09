//
//  PokemonListInteractor.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation
import PokemonAppAPI

final class PokemonListInteractor {

    // MARK: - Properties

    weak var delegate: PokemonListInteractorDelegate?

    private let service: PokemonServiceProtocol
    private let group = DispatchGroup()
    private var pokemons: [Pokemon] = []

    // MARK: - Initializer

    init(service: PokemonServiceProtocol) {
        self.service = service
    }
}

// MARK: - Private Methods

private extension PokemonListInteractor {

    func fetchPokemonsDetail() {
        pokemons.enumerated().forEach { sequence in
            let pokemon = sequence.element
            guard let name = pokemon.name else { return }
            group.enter()
            service.fetchPokemonDetail(name: name) { [weak self] result in
                guard let self = self else { return }
                self.group.leave()
                switch result {
                case .success(let response):
                    self.pokemons[sequence.offset].imageUrl = response.sprites?.imageUrl
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }

        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            let pokemonPresentations = self.pokemons.map(PokemonPresentation.init)
            self.delegate?.handleOutput(.showPokemonList(pokemonPresentations))
        }
    }
}

// MARK: - PokemonListInteractorProtocol

extension PokemonListInteractor: PokemonListInteractorProtocol {

    func load() {
        delegate?.handleOutput(.setLoading(true))
        group.enter()
        service.fetchPokemons { [weak self] result in
            guard let self = self else { return }
            self.group.leave()
            switch result {
            case .success(let response):
                self.pokemons = response.results ?? []
                self.fetchPokemonsDetail()
            case .failure(let error):
                print(error)
            }
        }
    }

    func selectPokemon(at index: Int) {
        guard let name = pokemons[index].name else { return }
        delegate?.handleOutput(.showPokemonDetail(pokemonName: name))
    }
}
