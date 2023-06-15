//
//  UCAverageAppApp.swift
//  UCAverageApp
//
//  Created by etudiant on 24/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub
import UCAverageJson

@main
struct UCAverageApp: App {
    @StateObject
    var odinVM: OdinVM = OdinVM(from: Stub().load())
    
    var jsonDataManager: JsonDataManager = JsonDataManager(withFilename: "odin.data")

    var body: some Scene {
        WindowGroup {
            HomePage(odinVM: odinVM)
        }
    }
}
