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
                self.model[index] = blockVM.model
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
