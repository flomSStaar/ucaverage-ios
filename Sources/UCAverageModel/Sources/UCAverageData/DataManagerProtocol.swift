//
//  DataManagerProtocol.swift
//  
//
//  Created by etudiant on 15/06/2023.
//

import Foundation
import UCAverageModel

public protocol DataManagerProtocol {
    func load() -> [Block]
    func save(_ blocks: [Block])
}
