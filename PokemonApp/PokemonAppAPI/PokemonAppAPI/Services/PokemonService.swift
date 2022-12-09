//
//  PokemonService.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation
import Alamofire

public protocol PokemonServiceProtocol {
    func fetchPokemons(completion: @escaping Completion<PokemonsResponse>)
    func fetchPokemonDetail(name: String, completion: @escaping Completion<PokemonDetailResponse>)
}

public final class PokemonService {

    public init() {}
}

// MARK: - PokemonServiceProtocol

extension PokemonService: PokemonServiceProtocol {

    public func fetchPokemons(completion: @escaping Completion<PokemonsResponse>) {
        let request = PokemonsRequest()
        ServiceManager.shared.request(request) { (response: Result<PokemonsResponse, ServiceError>) in
            switch response {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.serverError(error: error)))
            }
        }
    }

    public func fetchPokemonDetail(name: String, completion: @escaping Completion<PokemonDetailResponse>) {
        var request = PokemonDetailRequest()
        request.path = String(format: request.path, name)
        ServiceManager.shared.request(request) { (response: Result<PokemonDetailResponse, ServiceError>) in
            switch response {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.serverError(error: error)))
            }
        }
    }
}
