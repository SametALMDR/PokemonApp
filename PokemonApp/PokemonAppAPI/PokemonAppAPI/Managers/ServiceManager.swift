//
//  ServiceManager.swift
//  PokemonAppAPI
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import Foundation
import Alamofire

final class ServiceManager {

    static let shared: ServiceManager = ServiceManager()

    private init() {}

    func request<T>(
        _ request: BaseRequestProtocol,
        completion: @escaping Completion<T>
    ) where T: Decodable {
        AF.request(
            request.fullPath,
            method: request.method,
            parameters: request.parameters,
            encoding: request.encoding,
            headers: request.headers)
        .responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.baseDecoder
                do {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.parseError(error: error)))
                }
            case .failure(let error):
                completion(.failure(.serverError(error: error)))
            }
        }
    }
}
