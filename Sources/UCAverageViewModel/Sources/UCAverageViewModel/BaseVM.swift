//
//  BaseVm.swift
//  
//
//  Created by etudiant on 02/06/2023.
//

import Foundation

public class BaseVM: ObservableObject {
    private var updatedCallback: [AnyHashable:(BaseVM) -> ()] = [:]
    
    public func subscribe(for hash: AnyHashable, _ callback: @escaping (BaseVM) -> ()) {
        updatedCallback[hash] = callback
    }
    
    public func unsubscribe(from hash: AnyHashable) {
        updatedCallback.removeValue(forKey: hash)
    }
    
    public func onModelChanged() {
        for callback in updatedCallback {
            callback.value(self)
        }
    }
}
