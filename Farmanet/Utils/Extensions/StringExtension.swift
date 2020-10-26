//
//  StringExtensions.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import Foundation

extension String {
    
    func queryString(params: [String: String]) -> String {
        var components = URLComponents(string: self)
        components?.setQueryItems(with: params)
        return components?.url?.absoluteString ?? self
    }
    
}
