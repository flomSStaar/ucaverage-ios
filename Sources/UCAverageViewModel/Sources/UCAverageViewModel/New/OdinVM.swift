//
//  OdinVM.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation
import UCAverageModel

public class OdinVM {

    var model: [Block]
    
    @Published
    public private(set) var blocks: [BlockVM] = []
    
    public init(from model: [Block]) {
        self.model = model
        self.blocks = model.map { createBlockVM(with: $0) }
    }
    
    private func createBlockVM(with model: Block) -> BlockVM {
        let blockVM = BlockVM(withModel: model)
        return blockVM
    }
}
