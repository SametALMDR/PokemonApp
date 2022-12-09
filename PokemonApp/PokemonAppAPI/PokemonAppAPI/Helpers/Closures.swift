//
//  Closures.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation

public typealias Completion<T: Decodable> = ((Result<T, ServiceError>) -> Void)
