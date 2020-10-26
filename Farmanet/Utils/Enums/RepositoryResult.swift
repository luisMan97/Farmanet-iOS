//
//  RepositoryResult.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import Foundation

enum RepositoryResult {
    case success(response: Codable)
    case error(error: String)
}
