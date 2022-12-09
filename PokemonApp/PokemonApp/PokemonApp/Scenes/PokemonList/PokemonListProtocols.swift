//
//  PokemonListProtocols.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation
import struct PokemonAppAPI.Pokemon

// MARK: - Interactor

protocol PokemonListInteractorProtocol: AnyObject {
    var delegate: PokemonListInteractorDelegate? { get set }
    func load()
    func selectPokemon(at index: Int)
}

enum PokemonListInteractorOutput {
    case setLoading(Bool)
    case showPokemonList([PokemonPresentation])
    case showPokemonDetail(pokemonName: String)
}

protocol PokemonListInteractorDelegate: AnyObject {
    func handleOutput(_ output: PokemonListInteractorOutput)
}

// MARK: - Presenter

enum PokemonListPresenterOutput {
    case setLoading(Bool)
    case showPokemonList([PokemonPresentation])
}

protocol PokemonListPresenterProtocol: AnyObject {
    func load()
    func selectPokemon(at index: Int)
}

// MARK: - View

protocol PokemonListVCProtocol: AnyObject {
    func handleOutput(_ output: PokemonListPresenterOutput)
}

// MARK: - Router

enum PokemonListRoute {
    case detail(pokemonName: String)
}

protocol PokemonListRouterProtocol: AnyObject {
    func navigate(to route: PokemonListRoute)
}
