//
//  JsonDataManager.swift
//  
//
//  Created by etudiant on 15/06/2023.
//

import Foundation
import UCAverageData
import UCAverageModel

public class JsonDataManager: DataManagerProtocol {
    
    public init(withFilename filename: String) {
        self.filename = filename
    }
    
    public private(set) var filename: String
    
    public func load() -> [Block] {
        return []
    }
    
    public func save(_ blocks: [Block]) {
        
    }
}
