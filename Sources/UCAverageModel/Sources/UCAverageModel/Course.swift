//
//  Course.swift
//  
//
//  Created by etudiant on 25/05/2023.
//

import Foundation

public struct Course: Identifiable, Equatable {
    public let id: UUID
    public var name: String
    public var coef: Int
    public var mark: Float
    
    public static func == (lhs: Course, rhs: Course) -> Bool { lhs.id == rhs.id }
    
    public init(withId id: UUID, andName name: String, andCoef coef: Int, andMark mark: Float) {
        self.id = id
        self.name = name
        self.coef = coef
        self.mark = mark
    }
    
    public init(withName name: String, andCoef coef: Int, andMark mark: Float) {
        self.init(withId: UUID(), andName: name, andCoef: coef, andMark: mark)
    }
    
    public func same(with other: Course) -> Bool {
        return self.id == other.id
        && self.name == other.name
        && self.coef == other.coef
        && self.mark == other.mark
    }
}
