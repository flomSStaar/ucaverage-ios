//
//  BlocksVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

class BlocksVM: ObservableObject {
    
    @Published public var blocks: [Block]
    
    public init(withBlocks blocks: [Block]) {
        self.blocks = blocks
    }
}
