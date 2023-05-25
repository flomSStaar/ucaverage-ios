//
//  UE.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct UE: Identifiable {
    public let id: UUID
    public var name: String
    public var coef: Int
    public var courses: [Course] = []
    
    public var average: Float {
        var totalCoef: Float = 0
        var totalMarks: Float = 0
        
        courses.forEach { course in
            totalCoef += Float(course.coef)
            totalMarks += course.mark * Float(course.coef)
        }
        
        guard totalCoef > 0 else { return 0}
        
        return totalMarks / totalCoef
    }
    
    public init(withId id: UUID, andName name: String, andCoef coef: Int) {
        self.id = id
        self.name = name
        self.coef = coef
    }
    
    public init(withName name: String, andCoef coef: Int) {
        self.init(withId: UUID(), andName: name, andCoef: coef)
    }
}
