//
//  NetworkingValidator.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import UIKit

class NetworkingValidator {
    
    static func isValidStatusCode(response: URLResponse?) -> Bool {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            return false
        }
        
        return 200 ... 299 ~= statusCode
    }
    
}
