//
//  UnitVM.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation
import UCAverageModel

public class UnitVM: BaseVM, Identifiable, Hashable {
    
    @Published
    //TODO remettre le private(set)
    public var isEditing: Bool = false
    
    @Published
    public private(set) var copy: UnitVM? = nil
    
    public init(withModel model: UCAUnit) {
        super.init()
        self.model = model
    }
    
    @Published
    var model: UCAUnit = UCAUnit(withName: "", andCoef: 0) {
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name
            }
            if self.coef != self.model.coef {
                self.coef = self.model.coef
            }
            if !self.model.courses.compare(to: self.courses.map { $0.model }) {
                // unsubscribe previous course viewmodels
                self.courses.forEach { course in course.unsubscribe(from: self)}
                // create new viewmodels corresponding to the new courses
                self.courses = self.model.courses.map { createCourseVM(course: $0) }
            }
            
            onModelChanged()
        }
    }
    
    public var id: UUID { model.id }
    
    public var average: Float { model.average }
    
    @Published
    public var name: String = "" {
        didSet {
            if self.model.name != self.name {
                self.model.name = self.name
            }
        }
    }
    
    @Published
    public var coef: Int = 0 {
        didSet {
            if self.model.coef != self.coef {
                self.model.coef = self.coef
            }
        }
    }
    
    @Published
    public var courses: [CourseVM] = [] {
        didSet {
            let courseModels = self.courses.map { $0.model }
            if !self.model.courses.compare(to: courseModels) {
                self.model.courses = courseModels
            }
        }
    }
    
    public func onEditing() {
        self.copy = UnitVM(withModel: model)
        isEditing = true
        
    }
    
    public func onEdited(isCancelled cancelled: Bool = false) {
        if !cancelled {
            if let copy = self.copy {
                self.model = copy.model
            }
        }
        self.copy = nil
        isEditing = false
    }
    
    public func addCourse(withName name: String, andCoef coef: Int, andMark mark: Float) {
        self.model.addCourse(withName: name, andCoef: coef, andMark: mark)
    }
    
    public func removeCourse(withId id: UUID) {
        self.model.removeCourse(withId: id)
    }
    
    private func courseVM_Changed(baseVM: BaseVM) {
        if let courseVM = baseVM as? CourseVM {
            self.model.updateCourse(from: courseVM.model)
            objectWillChange.send()
        }
    }
    
    private func createCourseVM(course: Course) -> CourseVM {
        let courseVM = CourseVM(withModel: course)
        courseVM.subscribe(for: self, courseVM_Changed)
        return courseVM
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: UnitVM, rhs: UnitVM) -> Bool {
        lhs.id == rhs.id
    }
}
