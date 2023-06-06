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
    public var units: [UCAUnit]
    
    public var average: Float {
        var totalCoef: Float = 0
        var totalMarks: Float = 0
        
        units.forEach { ue in
            totalCoef += Float(ue.coef)
            totalMarks += ue.average * Float(ue.coef)
        }
        
        guard totalCoef > 0 else { return 0}
        
        return totalMarks / totalCoef
    }
    
    public init(withId id: UUID, andName name: String, andUnits units: [UCAUnit]) {
        self.id = id
        self.name = name
        self.units = units
    }

    public init(withId id: UUID, andName name: String) {
        self.init(withId: id, andName: name, andUnits: [])
    }
    
    public init(withName name: String, andUnits units: [UCAUnit]) {
        self.init(withId: UUID(), andName: name, andUnits: units)
    }
    
    public init(withName name: String) {
        self.init(withId: UUID(), andName: name, andUnits: [])
    }
    
    public mutating func updateUnit(from unit: UCAUnit) {
        let index = self.units.firstIndex(of: unit)
        
        if let index {
            self.units[index] = unit
        }
    }
}
