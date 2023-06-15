//
//  UCAUnit.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation

public struct UCAUnit: Identifiable, Equatable, Codable {

    public let id: UUID
    public var name: String
    public var coef: Int
    public var courses: [Course]
    
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
        self.init(withId: id, andName: name, andCoef: coef, andCourses: [])
    }
    
    public init(withName name: String, andCoef coef: Int, andCourses courses: [Course]) {
        self.init(withId: UUID(), andName: name, andCoef: coef, andCourses: courses)
    }
    
    public init(withId id: UUID, andName name: String, andCoef coef: Int, andCourses courses: [Course]) {
        self.id = id
        self.name = name
        self.coef = coef
        self.courses = courses
    }
    
    public init(withName name: String, andCoef coef: Int) {
        self.init(withId: UUID(), andName: name, andCoef: coef)
    }
    
    public mutating func addCourse(withName name: String, andCoef coef: Int, andMark mark: Float) {
        self.courses.append(Course(withName: name, andCoef: coef, andMark: mark))
    }
    
    public mutating func removeCourse(withId id: UUID) {
        if let index = self.courses.firstIndex(where: { $0.id == id }) {
            self.courses.remove(at: index)
        }
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
    
    public static func == (lhs: UCAUnit, rhs: UCAUnit) -> Bool {
        lhs.id == rhs.id
    }
}
