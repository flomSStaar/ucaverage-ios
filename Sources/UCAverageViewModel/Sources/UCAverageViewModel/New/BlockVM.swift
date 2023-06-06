//
//  BlockVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

public class BlockVM: BaseVM, Equatable {
    
    @Published
    public private(set) var isEditing: Bool = false
    
    @Published
    public private(set) var copy: BlockVM? = nil
    
    public init(withModel model: Block) {
        self.model = model
        super.init()
    }
    
    @Published
    var model: Block {
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name
            }
            if checkUnitsNotEquals() {
                self.units = self.model.units.map { createUnitVM(unit: $0) }
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
    public var units: [UnitVM] = [] {
        didSet {
            if checkUnitsNotEquals() {
                self.model.units = self.units.map { $0.model }
            }
        }
    }
    
    public func onEditing() {
        self.copy = BlockVM(withModel: self.model)
        self.isEditing = true
    }
    
    public func onEdited(isCancelled cancelled: Bool) {
        if (!cancelled) {
            update()
        }
        self.isEditing = false
    }
    
    private func update() {
        if let copy = self.copy {
            self.model = copy.model
        }
    }
    
    private func checkUnitsNotEquals() -> Bool {
        return self.model.units.count != self.units.count
        || !self.model.units.allSatisfy { unit in
            self.units.contains { unitVM in
                unitVM.model.same(with: unit)
            }
        }
    }
    
    private func unitVM_Changed(baseVM: BaseVM) {
        if let unitVM = baseVM as? UnitVM {
            self.model.updateUnit(from: unitVM.model)
            objectWillChange.send()
        }
    }
    
    private func createUnitVM(unit: UCAUnit) -> UnitVM {
        let unitVM = UnitVM(withModel: unit)
        unitVM.addUpdatedCallback(callback: unitVM_Changed)
        return unitVM
    }
    
    public static func == (lhs: BlockVM, rhs: BlockVM) -> Bool {
        lhs.id == rhs.id
    }
}
