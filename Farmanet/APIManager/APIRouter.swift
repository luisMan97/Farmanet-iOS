//
//  APIRouter.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case Stores
    
    private var method: Alamofire.HTTPMethod {
        switch self {
        case .Stores:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .Stores:
            return "getLocales"
        }
    }
    
    private var url: String {
        return APIManagerConstants.endpoint
    }
    
    private func urlRequest() throws -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return try Alamofire.JSONEncoding.default.encode(urlRequest as URLRequestConvertible, with: nil)
    }
    
    private func nsUrlRequest() throws -> URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else {
            return nil
        }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return try Alamofire.JSONEncoding.default.encode(urlRequest as URLRequestConvertible, with: nil)
    }
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .Stores:
            return try urlRequest()!
        }
    }

}
