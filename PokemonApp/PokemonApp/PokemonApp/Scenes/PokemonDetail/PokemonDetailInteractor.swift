//
//  PokemonDetailInteractor.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation
import PokemonAppAPI

final class PokemonDetailInteractor {

    // MARK: - Properties

    weak var delegate: PokemonDetailInteractorDelegate?

    private let service: PokemonServiceProtocol
    private let pokemonName: String

    // MARK: - Initializer

    init(
        service: PokemonServiceProtocol,
        pokemonName: String
    ) {
        self.service = service
        self.pokemonName = pokemonName
    }
}

// MARK: - PokemonDetailInteractorProtocol

extension PokemonDetailInteractor: PokemonDetailInteractorProtocol {

    func load() {
        delegate?.handleOutput(.setLoading(true))
        service.fetchPokemonDetail(name: pokemonName) { [weak self] result in
            guard let self = self else { return }
            self.delegate?.handleOutput(.setLoading(false))
            switch result {
            case .success(let response):
                let pokemonDetailPresentation = PokemonDetailPresentation(pokemonDetailResponse: response)
                self.delegate?.handleOutput(.showDetail(pokemonDetailPresentation))
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
