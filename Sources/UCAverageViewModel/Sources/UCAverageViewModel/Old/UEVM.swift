//
//  UEVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

//class UEVM: BaseVM, Identifiable, Equatable {
//    
//    public init(withModel model: UE) {
//        super.init()
//        self.model = model
//    }
//    
//    public static func == (lhs: UEVM, rhs: UEVM) -> Bool {
//        lhs.id == rhs.id
//    }
//    
//    public var id: UUID { model.id }
//    
//    @Published
//    public var isEditing: Bool = false
//    
//    @Published
//    public var copy: UEVM? = nil
//    
//    @Published
//    public private(set) var model: UE = UE(withName: "", andCoef: 0) {
//        didSet {
//            modelDidSet()
//            onModelChanged()
//        }
//    }
//    
//    public func onEditing() {
//        self.copy = UEVM(withModel: model)
//        isEditing = true
//        
//    }
//    
//    public func onEdited(isCancelled cancelled: Bool = false) {
//        if !isEditing { return }
//        
//        if !cancelled {
//            update()
//        }
//        self.copy = nil
//        isEditing = false
//    }
//    
//    func modelDidSet() {
//        if self.name != self.model.name {
//            self.name = self.model.name
//        }
//        if self.coef != self.model.coef {
//            self.coef = self.model.coef
//        }
//        if checkCoursesNotEquals() {
//            self.courses = self.model.courses.map { createCourse(course: $0) }
//        }
//    }
//    
//    func update() {
//        if let copy = self.copy {
//            self.model = copy.model
//            
//        }
//    }
//    
//    @Published
//    public var name: String = "" {
//        didSet {
//            if self.model.name != self.name {
//                self.model.name = self.name
//            }
//        }
//    }
//    
//    @Published
//    public var coef: Int = 0 {
//        didSet {
//            if self.model.coef != self.coef {
//                self.model.coef = self.coef
//            }
//        }
//    }
//    
//    public var average: Float {
//        model.average
//    }
//    
//    @Published
//    public var courses: [CourseVM] = [] {
//        didSet {
//            if checkCoursesNotEquals() {
//                self.model.courses = self.courses.map { $0.model }
//            }
//        }
//    }
//    
//    private func checkCoursesNotEquals() -> Bool {
//        return self.model.courses.count != self.courses.count
//        || !self.model.courses.allSatisfy({ course in
//            self.courses.contains { courseVM in
//                courseVM.model.id == course.id
//                && courseVM.model.name == course.name
//                && courseVM.model.coef == course.coef
//                && courseVM.model.mark == course.mark
//            }
//        })
//    }
//    
//    public func addCourse(withName name: String, andCoef coef: Int, andMark mark: Float) {
//        model.courses.append(Course(withName: name, andCoef: coef, andMark: mark))
//    }
//    
//    public func removeCourse(withId id: UUID) {
//        if let index = model.courses.firstIndex(where: { $0.id == id }) {
//            model.courses.remove(at: index)
//        }
//    }
//    
//    private func courseVM_Changed(baseVM: BaseVM) {
//        if let courseVM = baseVM as? CourseVM {
//            self.model.updateCourse(from: courseVM.model)
//            objectWillChange.send()
//        }
//    }
//    
//    private func createCourse(course: Course) -> CourseVM {
//        let courseVM = CourseVM(withModel: course)
//        courseVM.addUpdatedCallback(callback: courseVM_Changed)
//        return courseVM
//    }
//}
