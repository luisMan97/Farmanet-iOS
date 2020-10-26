//
//  StoreListHomeRepository.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

class StoreListHomeRepository {
    
    func getStores(completion: RepositoryResultBlock) {
        APIManager.request(service: .Stores) { (result: ServiceResultWithEntity<[Store], ErrorResponse>) in
            
            switch result {
            case .success(response: let stores):
                completion?(.success(response: stores))
            case.errorResult(entity: let entity):
                completion?(.error(error: entity.error))
            case .error(error: let error):
                completion?(.error(error: error.localizedDescription))
            }
        }
    }

}
