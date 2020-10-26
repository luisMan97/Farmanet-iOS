//
//  Debug.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import Foundation

class Debug {
    
    static func logError(_ error: Error) {
        print("\n\n===========Error===========")
        print("Error Code: \(error._code)")
        print("Error Messsage: \(error.localizedDescription)")
        debugPrint(error as Any)
        print("===========================\n\n")
    }

}
