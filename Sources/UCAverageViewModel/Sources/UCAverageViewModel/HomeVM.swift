//
//  HomeVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

public class HomeVM: ObservableObject {
    @Published public var blocks: [Block]
    @Published public var ues: [UE]
    
    public init(withBlocks blocks: [Block], andUEs ues: [UE]) {
        self.blocks = blocks
        self.ues = ues
    }
    
    func updateUE(with ueVM: UEVM) {
        if let i = ues.firstIndex(where: { $0.id == ueVM.original.id }) {
            ues[i] = ueVM.original
        } else {
            ues.append(ueVM.original)
        }
    }
}
