//
//  WebRepository.swift
//  imece
//
//  Created by Kemal Şen on 23.10.2022.
//

import Foundation
import Combine

protocol WebRepository {
    var session: URLSession { get }
    var baseURL: String { get }
    var bgQueue: DispatchQueue { get }
}

extension WebRepository {
    func call<Value>(endpoint: APICall, httpCodes: HTTPCodes = .success) -> AnyPublisher<Value, Error>
        where Value: Decodable {
        do {
            let request = try endpoint.urlRequest(baseURL: baseURL)
            print(request)
            return session
                .dataTaskPublisher(for: request)
                .handleEvents(receiveSubscription: { print("Receive subscription: \($0)") },
                                  receiveOutput: { print("Receive output: \($0)") },
                                  receiveCompletion: { print("Receive completion: \($0)") },
                                  receiveCancel: { print("Receive cancel") },
                                  receiveRequest: { print("Receive request: \($0)") })
                .requestJSON(httpCodes: httpCodes)
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
}

extension WebRepository {
    static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
}

// MARK: - Helpers

extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func requestData(httpCodes: HTTPCodes = .success) -> AnyPublisher<Data, Error> {
        return tryMap {
                assert(!Thread.isMainThread)
                guard let code = ($0.1 as? HTTPURLResponse)?.statusCode else {
                    throw APIError.unexpectedResponse
                }
                guard httpCodes.contains(code) else {
                    throw APIError.httpCode(code)
                }
                return $0.0
            }
            .extractUnderlyingError()
            .eraseToAnyPublisher()
    }
}

private extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func requestJSON<Value>(httpCodes: HTTPCodes) -> AnyPublisher<Value, Error> where Value: Decodable {
        return requestData(httpCodes: httpCodes)
            .decode(type: Value.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
