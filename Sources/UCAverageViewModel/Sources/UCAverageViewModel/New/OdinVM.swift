//
//  OdinVM.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation
import UCAverageModel

public class OdinVM: BaseVM {
    
    var model: [Block]
    
    @Published
    public private(set) var blocks: [BlockVM] = []
    
    public init(from model: [Block]) {
        self.model = model
        super.init()
        
        model.forEach { self.blocks.append(createBlockVM(with: $0)) }
    }
    
    private func blockVM_Changed(baseVM: BaseVM) {
        if let blockVM = baseVM as? BlockVM {
            if let index = self.blocks.firstIndex(of: blockVM) {
                // update the model corresponding to the vm passed as parameter
                self.model[index] = blockVM.model
                
                // update other block with new value
                for unit in blockVM.units {
                    for i in 0..<self.model.count {
                        if i == index { continue }
                        
                        if model[i].units.contains(where: { $0.id == unit.id }) {
                            model[i].updateUnit(from: unit.model)
                        }
                    }
                }
                
                // refresh all vms
                self.blocks = self.model.map { createBlockVM(with: $0) }
                objectWillChange.send()
            }
        }
    }
    
    private func createBlockVM(with model: Block) -> BlockVM {
        let blockVM = BlockVM(withModel: model)
        blockVM.addUpdatedCallback(callback: blockVM_Changed)
        return blockVM
    }
}
