//
//  File.swift
//  
//
//  Created by etudiant on 02/06/2023.
//

import Foundation

protocol VMEditable {
    associatedtype Model

    func update(copy: EditableVM<Model>)
    func onEditing()
    func onEdited(isCancelled cancelled: Bool)
    func modelDidSet()
}

public class EditableVM<Model>: BaseVM, VMEditable {
    
    public init(withModel model: Model) {
        self.model = model
    }
    
    @Published
    public var isEditing: Bool = false
    
    @Published
    public var copy: EditableVM<Model>? = nil
    
    @Published
    public internal(set) var model: Model {
        didSet {
            modelDidSet()
            onModelChanged()
        }
    }
    
    public func onEditing() {
        self.copy = EditableVM<Model>(withModel: model)
        isEditing = true
        
    }
    
    public func onEdited(isCancelled cancelled: Bool = false) {
        if !cancelled {
            if let copy = self.copy {
                update(copy: copy)
            }
        }
        isEditing = false
    }
    
    func update(copy: EditableVM<Model>) {}
    func modelDidSet() {}
}
