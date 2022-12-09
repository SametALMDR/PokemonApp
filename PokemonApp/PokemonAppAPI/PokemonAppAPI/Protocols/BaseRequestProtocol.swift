//
//  BaseRequestProtocol.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation
import Alamofire

protocol BaseRequestProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String]? { get }
    var encoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
}

// Default Values

extension BaseRequestProtocol {

    var fullPath: String {
        APIEnv.current.baseUrl + path
    }

    var method: HTTPMethod {
        .get
    }

    var parameters: [String : String]? {
        nil
    }

    var encoding: ParameterEncoding {
        JSONEncoding.default
    }

    var headers: HTTPHeaders? {
        nil
    }
}
