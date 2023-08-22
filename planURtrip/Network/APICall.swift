//
//  APICall.swift
//  imece
//
//  Created by Kemal Şen on 23.10.2022.
//

import Foundation
import UIKit

protocol APICall {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var quertyItems: [URLQueryItem]? { get }
    func body() throws -> Data?
}

enum APIError: Swift.Error {
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case imageDeserialization
    case requestFailed
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case jsonConversionFailure
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case let .httpCode(code): return "Unexpected HTTP code: \(code)"
        case .unexpectedResponse: return "Unexpected response from the server"
        case .imageDeserialization: return "Cannot deserialize image from Data"
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}

extension APICall {
    func urlRequest(baseURL: String) throws -> URLRequest {
        var components = URLComponents(string: baseURL)
        components?.queryItems = quertyItems
    //    components?.path = path
        let type = Bundle.main.infoDictionary?["TYPE"] as? String ?? "-"
        components?.path = path.starts(with: "/") ? "\(path)" : "/\(path)"
        
        guard let url = components?.url else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        var combineHeaders = headers ?? [:]
        
        combineHeaders["Imece-Channel"] = "ios"
        combineHeaders["Imece-DeviceModel"] = UIDevice.current.modelName
        combineHeaders["Imece-DeviceBrand"] = UIDevice.current.userInterfaceIdiom.rawValue.description
        combineHeaders["Imece-DeviceVersion"] = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        combineHeaders["Imece-Application"] = UIDevice.current.getAppInfo()
        combineHeaders["Imece-Version"] = UIDevice.current.getOSInfo()
      //  combineHeaders["Imece-Language"] = "tr" // TODO : Change Later
        combineHeaders["Accept-Language"] = "tr"
        combineHeaders["Content-Type"] = "application/json"
        
        if let token = LoginHelper.shared.token {
            combineHeaders["Authorization"] = "Bearer \(token)"
        }
        
        request.allHTTPHeaderFields = combineHeaders
        
        request.httpBody = try body()
       return request
    }
}

typealias HTTPCode = Int
typealias HTTPCodes = Range<HTTPCode>

extension HTTPCodes {
    static let success = 200 ..< 300
}
