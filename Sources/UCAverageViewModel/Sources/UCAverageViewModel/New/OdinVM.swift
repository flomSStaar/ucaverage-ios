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
    
    private func createBlockVM(with model: Block) -> BlockVM {
        let blockVM = BlockVM(withModel: model)
        return blockVM
    }
}
