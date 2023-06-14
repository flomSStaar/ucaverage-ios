//
//  File.swift
//  
//
//  Created by etudiant on 02/06/2023.
//

import Foundation

public class BaseVM: ObservableObject {
    private var updatedCallback: [(BaseVM) -> ()] = []
    
    public func addUpdatedCallback(callback: @escaping (BaseVM) -> ()) {
        updatedCallback.append(callback)
    }
    
    public func onModelChanged() {
        for callback in updatedCallback {
            callback(self)
        }
    }
}
