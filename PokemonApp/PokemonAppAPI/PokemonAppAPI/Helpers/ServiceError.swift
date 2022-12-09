//
//  ServiceError.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation

public enum ServiceError: Error {
    case unknown
    case parseError(error: Error)
    case serverError(error: Error)
}
