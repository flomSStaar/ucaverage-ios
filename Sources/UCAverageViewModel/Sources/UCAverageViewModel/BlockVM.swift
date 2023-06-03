//
//  BlockVM.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

public extension Block {
    struct Data: Identifiable {
        public let id: UUID
        public var name: String
        //public var ues: [UE.Data] = []
    }

    var data: Data {
        //Data(id: self.id, name: self.name, ues: self.ues.map { $0.data })
        Data(id: self.id, name: self.name)
    }

    mutating func update(from data: Data) {
        guard self.id == data.id else { return }
        
        self.name = data.name
        //self.ues = data.ues.map { $0.toUE() }
    }
}

public class BlockVM: ObservableObject {
    public var original: Block
    
    @Published public var model: Block.Data
    @Published public var isEditing: Bool = false

    public init(withBlock block: Block) {
        self.original = block
        self.model = block.data
    }
    
    public convenience init() {
        self.init(withBlock: Block(withName: ""))
    }

    public func onEditing() {
        isEditing = true
        model = original.data
    }
    
    public func onEdited(isCancelled cancelled: Bool) {
        if (!cancelled) {
            original.update(from: model)
        }
        isEditing = false
        model = original.data
    }
}
