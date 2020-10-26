//
//  Errors.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import Foundation

enum Errors: Error {
    case endpoint
    case badResponse
    case custom(error: Error?)
    case emptyContent
    case unknown(error: String?)
    case serializacion(error: Error?)
    
    var localizedDescription: String {
        let unknownError = "Unknown error."
        
        switch self {
        case .endpoint:
            return "Unable to convert the endpoint." // "Bad URL"
            
        case .badResponse:
            return "Unable to determinate a success response."
            
        case .custom(let error):
            return error?.localizedDescription ?? unknownError
            
        case .emptyContent:
            return "Empty content"
            
        case .unknown(let error):
            return error ?? unknownError
        case .serializacion(let error):
            if let error = error {
                return "Error serializacion json \(error.localizedDescription)"
            }
            return unknownError
        }
    }
}
