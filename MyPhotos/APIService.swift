//
//  APIService.swift
//  MyPhotos
//
//  Created by Ronak Malick on 27/03/24.
//

import Foundation

enum NetworkError: Error, Equatable {
    case badRequest
    case badHTTPResponse
    case badResponse
    case generic(String)
    case noError
}

class APIService {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchPhotos(endpoint: String, onCompletion: @escaping (Result<[Photo], NetworkError>) -> (Void)) {
        guard let req = buildRequest(endpoint) else {
            onCompletion(.failure(.badRequest))
            return
        }
        let task = session.dataTask(with: req) { data, response, error in
            if let _ = error {
                onCompletion(.failure(.badResponse))
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                onCompletion(.failure(.badHTTPResponse))
                return
            }
    
            if response.statusCode == 200 {
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode([Photo].self, from: data)
                        print(model)
                        onCompletion(.success(model))
                    }
                    catch {
                        onCompletion(.failure(.generic(error.localizedDescription)))
                    }
                }
            } else {
                onCompletion(.failure(.badResponse))
            }
            
        }
        task.resume()
    }
    
    private func buildRequest(_ endpoint: String) -> URLRequest? {
        guard let url = URL(string: endpoint) else { return nil }
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.timeoutInterval = 60.0
        req.allowsCellularAccess = true
        req.cachePolicy = .useProtocolCachePolicy
        return req
    }
}
