//
//  ServiceResultWithEntity.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import Foundation

enum ServiceResultWithEntity<T: Codable, Y: Codable> {
    case success(response: T)
    case error(error: Errors)
    case errorResult(entity: Y)
}
