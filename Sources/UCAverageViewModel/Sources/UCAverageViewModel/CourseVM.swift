//
//  CourseVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

public class CourseVM: BaseVM, Identifiable, Equatable {
    
    @Published
    public private(set) var isEditing: Bool = false
    
    @Published
    public private(set) var copy: CourseVM? = nil
    
    public init(withModel model: Course) {
        super.init()
        self.model = model
    }
    
    @Published
    public private(set) var model: Course = Course(withName: "", andCoef: 0, andMark: 0) {
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name
            }
            if self.coef != self.model.coef {
                self.coef = self.model.coef
            }
            if self.mark != self.model.mark {
                self.mark = self.model.mark
            }

            onModelChanged()
        }
    }
    
    public var id: UUID { model.id }
    
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
    public var mark: Float = 0 {
        didSet {
            if self.model.mark != self.mark {
                self.model.mark = self.mark
            }
        }
    }
    
    public func onEditing() {
        self.copy = CourseVM(withModel: model)
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

    public static func == (lhs: CourseVM, rhs: CourseVM) -> Bool {
        lhs.id == rhs.id
    }
    
}
