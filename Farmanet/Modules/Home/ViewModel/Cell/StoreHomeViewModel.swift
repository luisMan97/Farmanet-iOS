//
//  StoreHomeViewModel.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import Foundation

class StoreHomeViewModel {
    
    private var store: Store?
    
    init(store: Store?) {
        self.store = store
    }
    
    var name: String {
        return store?.name ?? ""
    }
    
    var address: String? {
        return store?.address
    }
    
    var locationName: String {
        return store?.locationName ?? ""
    }

}
