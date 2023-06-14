//
//  UnitVM.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation
import UCAverageModel

public class UnitVM: BaseVM, Identifiable, Equatable {
    
    @Published
    //TODO remettre le private(set)
    public var isEditing: Bool = false
    
    @Published
    public private(set) var copy: UnitVM? = nil
    
    public init(withModel model: UCAUnit) {
        super.init()
        
        // defer allows to call didSet in the constructor
        defer {
            self.model = model
        }
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
                self.courses = self.model.courses.map { createCourseVM(course: $0) }
            }
            //            if checkCoursesNotEquals() {
            //                self.courses = self.model.courses.map { createCourseVM(course: $0) }
            //            }
            
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
            //            if checkCoursesNotEquals() {
            //                self.model.courses = self.courses.map { $0.model }
            //            }
        }
    }
    
    public func onEditing() {
        self.copy = UnitVM(withModel: model)
        isEditing = true
        
    }
    
    public func onEdited(isCancelled cancelled: Bool = false) {
        if !cancelled {
            update()
        }
        self.copy = nil
        isEditing = false
    }
    
    private func update() {
        if let copy = self.copy {
            self.model = copy.model
        }
    }
    
    public func addCourse(withName name: String, andCoef coef: Int, andMark mark: Float) {
        self.model.addCourse(withName: name, andCoef: coef, andMark: mark)
    }
    
    public func removeCourse(withId id: UUID) {
        self.model.removeCourse(withId: id)
    }
    
    private func checkCoursesNotEquals() -> Bool {
        return self.model.courses.count != self.courses.count
        || !self.model.courses.allSatisfy({ course in
            self.courses.contains { courseVM in
                courseVM.model.id == course.id
                && courseVM.model.name == course.name
                && courseVM.model.coef == course.coef
                && courseVM.model.mark == course.mark
            }
        })
    }
    
    private func courseVM_Changed(baseVM: BaseVM) {
        if let courseVM = baseVM as? CourseVM {
            self.model.updateCourse(from: courseVM.model)
            objectWillChange.send()
        }
    }
    
    private func createCourseVM(course: Course) -> CourseVM {
        let courseVM = CourseVM(withModel: course)
        courseVM.addUpdatedCallback(callback: courseVM_Changed)
        return courseVM
    }
    
    public static func == (lhs: UnitVM, rhs: UnitVM) -> Bool {
        lhs.id == rhs.id
    }
}
