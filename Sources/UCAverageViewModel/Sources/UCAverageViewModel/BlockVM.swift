//
//  BlockVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

public class BlockVM: BaseVM, Identifiable, Hashable {
    
    @Published
    public private(set) var isEditing: Bool = false
    
    @Published
    public private(set) var copy: BlockVM? = nil
    
    public init(withModel model: Block) {
        super.init()
        self.model = model
    }
    
    @Published
    var model: Block = Block(withName: "") {
        didSet {
            if self.name != self.model.name {
                self.name = self.model.name
            }
            if !self.model.units.compare(to: self.units.map { $0.model }) {
                self.units.forEach { $0.unsubscribe(from: self) }
                self.units = self.model.units.map { createUnitVM(unit: $0)}
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
            let unitModels = self.units.map { $0.model }
            if !self.model.units.compare(to: unitModels) {
                self.model.units = unitModels
            }
        }
    }
    
    public func onEditing() {
        self.copy = BlockVM(withModel: self.model)
        self.isEditing = true
    }
    
    public func onEdited(isCancelled cancelled: Bool) {
        if (!cancelled) {
            if let copy = self.copy {
                self.model = copy.model
            }
        }
        self.isEditing = false
    }
    
    private func unitVM_Changed(baseVM: BaseVM) {
        if let unitVM = baseVM as? UnitVM {
            self.model.updateUnit(from: unitVM.model)
            objectWillChange.send()
        }
    }
    
    private func createUnitVM(unit: UCAUnit) -> UnitVM {
        let unitVM = UnitVM(withModel: unit)
        unitVM.subscribe(for: self, unitVM_Changed)
        return unitVM
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: BlockVM, rhs: BlockVM) -> Bool {
        lhs.id == rhs.id
    }
}
