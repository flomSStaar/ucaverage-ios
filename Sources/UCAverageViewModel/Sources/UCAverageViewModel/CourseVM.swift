//
//  CourseVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

extension Course {
    struct Data: Identifiable {
        public let id: UUID
        public var name: String
        public var coef: Int
        public var mark: Float
    }
    
    var data: Data {
        Data(id: self.id, name: self.name, coef: self.coef, mark: self.mark)
    }
    
    mutating func update(from data: Data) {
        guard data.id == self.id else {
            return
        }
        
        self.name = data.name
        self.coef = data.coef
        self.mark = data.mark
    }
}

public class CourseVM: ObservableObject {
    var original: Course
    
    @Published var model: Course.Data
    @Published var isEditing: Bool = false
    
    public init(withCourse course: Course) {
        self.original = course
        self.model = course.data
    }
    
    public convenience init() {
        self.init(withCourse: Course(withName: "", andCoef: 1, andMark: 0))
    }
    
    func onEditing() {
        model = original.data
        isEditing = true
    }
    
    func onEdited(isCancelled cancelled: Bool = false) {
        if(!cancelled) {
            original.update(from: model)
        }
        isEditing = false
        model = original.data
    }
}
