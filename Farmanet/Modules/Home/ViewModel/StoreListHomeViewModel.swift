//
//  StoreListHomeViewModel.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Foundation

class StoreListHomeViewModel {
    
    let stores = Observable<[Store]>()
    let error = Observable<String>()
    let showProgress = Observable<Bool>()
        
    var storesCount: Int {
        return stores.property?.count ?? 0
    }
    
    init() {
        getStores()
    }
    
    func getStore(at indexPathRow: Int) -> Store? {
        return stores.property?[indexPathRow]
    }
    
    private func getStores() {
        showProgress.property = true
        StoreListHomeRepository().getStores { [weak self] result in
            self?.showProgress.property = false
            switch result {
            case .success(response: let stores):
                self?.stores.property = stores as? [Store]
            case .error(error: let error):
                self?.error.property = error
            }
        }
    }

}
