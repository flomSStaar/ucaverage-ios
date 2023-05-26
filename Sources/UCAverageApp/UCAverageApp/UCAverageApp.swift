//
//  UCAverageAppApp.swift
//  UCAverageApp
//
//  Created by etudiant on 24/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

@main
struct UCAverageApp: App {
    @StateObject
    var uesVM: UEsVM = UEsVM(withUEs: loadUEs())
    
    @StateObject
    var blocksVM: BlocksVM = BlocksVM(withBlocks: loadBlocks())

    var body: some Scene {
        WindowGroup {
            HomePage(uesVM: uesVM, blocksVM: blocksVM)
        }
    }
}
