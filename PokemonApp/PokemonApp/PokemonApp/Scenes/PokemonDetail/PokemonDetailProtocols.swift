//
//  PokemonDetailProtocols.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import Foundation
import struct PokemonAppAPI.PokemonDetailResponse

// MARK: - Interactor

protocol PokemonDetailInteractorProtocol: AnyObject {
    var delegate: PokemonDetailInteractorDelegate? { get set }
    func load()
}

enum PokemonDetailInteractorOutput {
    case setLoading(Bool)
    case showDetail(PokemonDetailPresentation)
}

protocol PokemonDetailInteractorDelegate: AnyObject {
    func handleOutput(_ output: PokemonDetailInteractorOutput)
}

// MARK: - Presenter

protocol PokemonDetailPresenterProtocol {
    func load()
}

enum PokemonDetailPresenterOutput {
    case setLoading(Bool)
    case showDetail(PokemonDetailPresentation)
}

// MARK: - View

protocol PokemonDetailVCProtocol: AnyObject {
    func handleOutput(_ output: PokemonDetailPresenterOutput)
}
