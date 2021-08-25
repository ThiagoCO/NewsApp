//
//  NewsService.swift
//  NewsApp
//
//  Created by Usertqi on 04/08/21.
//

import Foundation
import Combine

protocol NewsServiceProtocol {
    func request(from endpoint: NewsAPI) -> AnyPublisher<ArticlesResponse, APIError>
}

struct NewsService: NewsServiceProtocol {
    
    func request(from endpoint: NewsAPI) -> AnyPublisher<ArticlesResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<ArticlesResponse, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if(200...209).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: ArticlesResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
}
