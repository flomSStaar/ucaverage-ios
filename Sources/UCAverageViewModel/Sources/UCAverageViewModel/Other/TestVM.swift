//
//  TestVM.swift
//  
//
//  Created by etudiant on 02/06/2023.
//

import Foundation
import UCAverageModel

public class TestVM: EditableVM<Course> {
    
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
    
    public override func update(copy: EditableVM<Course>) {
        if let copy = copy as? TestVM {
            self.name = copy.name
            self.coef = copy.coef
            self.mark = copy.mark
        }
    }
    
    public override func modelDidSet() {
        if self.name != self.model.name {
            self.name = self.model.name
        }
        if self.coef != self.model.coef {
            self.coef = self.model.coef
        }
        if self.mark != self.model.mark {
            self.mark = self.model.mark
        }
    }
}
