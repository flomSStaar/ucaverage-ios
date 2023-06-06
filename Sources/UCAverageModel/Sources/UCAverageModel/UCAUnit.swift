//
//  UCAUnit.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation

public struct UCAUnit: Identifiable, Equatable {

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
    
    public mutating func updateCourse(from course: Course) {
        let index = self.courses.firstIndex(of: course)
        
        if let index {
            self.courses[index] = course
        }
    }
    
    public func same(with other: UCAUnit) -> Bool {
        return self.id == other.id
        && self.name == other.name
        && self.coef == other.coef
        && self.courses.elementsEqual(other.courses, by: { c1, c2 in
            c1.same(with: c2)
        })
    }
}
