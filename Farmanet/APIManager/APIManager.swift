//
//  APIManager.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Alamofire

class APIManager {
    
    static var defaultHeaders: NSMutableDictionary = [
        "Content-Type": "application/json"
    ]
    
    static func setAuthenticationHeader(prefix: String, token: String) {
        APIManager.defaultHeaders["Authorization"] = "\(prefix) \(token)"
    }
    
    static func setHeader(key: String, value: String) {
        APIManager.defaultHeaders[key] = value
    }
    
    static func removeHeader(key: String) {
        APIManager.defaultHeaders.removeObject(forKey: key)
    }
    
}

extension APIManager {
    
    class func request<T: Codable, Y: Codable>(service: APIRouter, onCompletion: ServiceResultBlockWithError<T, Y>) {
            AF.request(service)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        print("value: ", value)
                        
                        guard let data = response.data else {
                            onCompletion?(.error(error: .emptyContent))
                            return
                        }
                        
                        if let dataAsString = String(data: data, encoding: .utf8) {
                            print(dataAsString)
                        }
                        
                        if !NetworkingValidator.isValidStatusCode(response: response.response) {
                            do {
                                let errorEntity = try Y.decode(data: data)
                                
                               onCompletion?(.errorResult(entity: errorEntity))
                            } catch let error {
                               onCompletion?(.error(error: .custom(error: error)))
                            }
                            
                            return
                        }
                        
                        do {
                            let entity = try T.decode(data: data)
                            onCompletion?(.success(response: entity))
                        } catch let jsonError {
                            onCompletion?(.error(error: .serializacion(error: jsonError)))
                        }
                    case .failure(let error):
                        Debug.logError(error)
                        onCompletion?(.error(error: .custom(error: error)))
                        return
                    }
            }
        }

}
