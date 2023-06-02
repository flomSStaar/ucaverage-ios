//
//  UEVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

public extension UE {
    struct Data: Identifiable {
        public let id: UUID
        public var name: String
        public var coef: Int
        public var courses: [Course.Data] = []
        
        public func toUE() -> UE {
            var ue = UE(withId: self.id, andName: self.name, andCoef: self.coef)
            ue.courses = self.courses.map { $0.toCourse() }
            return ue
        }
    }
    
    var data: Data {
        Data(id: self.id, name: self.name, coef: self.coef, courses: self.courses.map { $0.data })
    }
    
    mutating func update(from data: Data) {
        guard self.id == data.id else { return }
        
        self.name = data.name
        self.coef = data.coef
        self.courses = data.courses.map {
            Course(withId: $0.id, andName: $0.name, andCoef: $0.coef, andMark: $0.mark)
        }
    }
}

public class UEVM: ObservableObject {
    public var original: UE
    
    @Published public var model: UE.Data
    @Published public var isEditing: Bool = false
    
    public init(withUE ue: UE) {
        self.original = ue
        self.model = ue.data
    }
    
    public convenience init() {
        self.init(withUE: UE(withName: "", andCoef: 1))
    }
    
    public func onEditing() {
        model = original.data
        isEditing = true
    }
    
    public func onEdited(isCancelled cancelled: Bool = false) {
        if(!cancelled) {
            original.update(from: model)
        }
        isEditing = false
        model = original.data
    }
    
    public func addCourse(withName name: String, andCoef coef: Int, andMark mark: Float) {
        model.courses.append(Course.Data(id: UUID(), name: name, coef: coef, mark: mark))
    }
    
    public func removeCourse(withId id: UUID) {
        if let index = model.courses.firstIndex(where: { $0.id == id }) {
            model.courses.remove(at: index)
        }
    }
}
