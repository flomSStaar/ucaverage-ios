//
//  Block.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Block: Identifiable {
    public let id: UUID
    public var name: String
    public var ues: [UE] = []
    
    public var average: Float {
        var totalCoef: Float = 0
        var totalMarks: Float = 0
        
        ues.forEach { ue in
            totalCoef += Float(ue.coef)
            totalMarks += ue.average * Float(ue.coef)
        }
        
        guard totalCoef > 0 else { return 0}
        
        return totalMarks / totalCoef
    }
    
    public init(withId id: UUID, andName name: String) {
        self.id = id
        self.name = name
    }
    
    public init(withName name: String) {
        self.init(withId: UUID(), andName: name)
    }
}