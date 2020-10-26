//
//  Globals.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Foundation

// Utils
func InitView<T>(_ value: T, block: (_ object: T) -> Void) -> T {
    block(value)
    return value
}

// typealias
typealias RepositoryResultBlock = ((_ response: RepositoryResult) -> Void)?
typealias ServiceResultBlockWithError<T: Codable, Y: Codable> = ((_ response: ServiceResultWithEntity<T, Y>) -> Void)?
typealias ImageResultBlock = ((_ onSuccess: Bool) -> Void)?
