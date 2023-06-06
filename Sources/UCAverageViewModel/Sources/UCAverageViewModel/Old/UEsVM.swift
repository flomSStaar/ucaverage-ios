//
//  File.swift
//  
//
//  Created by etudiant on 26/05/2023.
//

import Foundation
import UCAverageModel

//class UEsVM: ObservableObject {
//    @Published
//    public var ues: [UEVM]
//    
//    public var model: [UE]
//    
//    public init(withUEs model: [UE]) {
//        self.model = model
//        self.ues = model.map { UEVM(withModel: $0) }
//        
//        ues.forEach { ue in
//            ue.addUpdatedCallback(callback: UEVMChanged)
//        }
//    }
//    
//    private func UEVMChanged(baseVM: BaseVM) {
//        if let ueVM = baseVM as? UEVM {
//            if let index = ues.firstIndex(of: ueVM) {
//                model[index] = ueVM.model
//                objectWillChange.send()
//            }
//        }
//    }
//    
//    public func update(with ueVM: UEVM) {
////        if let i = ues.firstIndex(where: { $0.id == ueVM.original.id }) {
////            ues[i] = ueVM.original
////        } else {
////            ues.append(ueVM.original)
////        }
//    }
//}
