//
//  Observable.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Foundation

class Observable<T> {
    
    typealias Listener = (T) -> Void
    
    private let thread : DispatchQueue
    var observe: Listener?
        
    var property: T? {
        didSet {
            if let property = property {
                thread.async {
                    self.observe?(property)
                }
            }
        }
    }
    
    init(_ value: T? = nil, thread dispatcherThread: DispatchQueue = DispatchQueue.main) {
        self.thread = dispatcherThread
        self.property = value
    }
    
    func bind(_ listener: Listener?) {
        self.observe = listener
    }
    
}
