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
    var odinVM: OdinVM = OdinVM(from: getStub())

    var body: some Scene {
        WindowGroup {
            HomePage(odinVM: odinVM)
                .onAppear {
                    let block = odinVM.blocks[0]
                    print("Name: \(block.name)")
                }
        }
    }
}
