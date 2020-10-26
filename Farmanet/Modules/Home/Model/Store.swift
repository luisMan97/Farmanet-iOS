//
//  Store.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Foundation

struct Store: Codable {
    let name: String?
    let address: String?
    let locationName: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "local_nombre"
        case address = "local_direccion"
        case locationName = "localidad_nombre"
    }
}
