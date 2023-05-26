//
//  File.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

public class UEsVM: ObservableObject {
    @Published public var ues: [UE]
    
    public init(withUEs ues: [UE]) {
        self.ues = ues
    }
    
    func update(with ueVM: UEVM) {
        if let i = ues.firstIndex(where: { $0.id == ueVM.original.id }) {
            ues[i] = ueVM.original
        } else {
            ues.append(ueVM.original)
        }
    }
}
