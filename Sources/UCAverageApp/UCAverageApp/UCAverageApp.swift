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
    var homeVM: HomeVM = HomeVM(withBlocks: loadBlocks(), andUEs: loadUEs())
    
    @StateObject
    var uesVM: UEsVM = UEsVM(withUEs: loadUEs())

    var body: some Scene {
        WindowGroup {
            HomePage(homeVM: homeVM, uesVM: uesVM)
        }
    }
}
