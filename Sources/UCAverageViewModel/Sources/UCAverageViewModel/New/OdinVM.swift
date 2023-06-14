//
//  OdinVM.swift
//  
//
//  Created by etudiant on 06/06/2023.
//

import Foundation
import UCAverageModel

public class OdinVM: BaseVM {
    
    public var model: [Block] {
        self.blocks.map { $0.model }
    }
    
    @Published
    public private(set) var blocks: [BlockVM] = []
    
    public init(from model: [Block]) {
//        self.model = model
        super.init()
        
        model.forEach { self.blocks.append(createBlockVM(with: $0)) }
    }
    
    private func blockVM_Changed(baseVM: BaseVM) {
        if let blockSourceVM = baseVM as? BlockVM {
            // on vérifie si le bloc source est présent dans la liste des blocs vm
            if self.blocks.contains(where: { $0.id == blockSourceVM.id }) {
                // liste tous les ues qui sont présents dans le bloc modifié
                for unitVM in blockSourceVM.units {
                    // liste tous les blocks de la vm
                    for block in self.blocks {
                        // si le bloc est le même que celui source, on continue
                        if block.id == blockSourceVM.id { continue }
                        // si le block contient l'ue mis à jour
                        if let index = block.units.firstIndex(where: { $0.id == unitVM.id }) {
                            // si l'ue est différent, en utilisant la comparaison globale, on met à jour
                            if !block.units[index].model.same(with: unitVM.model) {
                                block.units[index].model = unitVM.model
                            }
                        }
                    }
                }
                
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
