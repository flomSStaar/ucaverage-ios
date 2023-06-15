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
import UCAverageData

@main
struct UCAverageApp: App {
    @StateObject
    var odinVM: OdinVM = OdinVM(from: [])
    
    @Environment(\.scenePhase) private var scenePhase
    
    var dataManager: DataManagerProtocol = JsonDataManager(withFilename: "odin.data")
    
    var body: some Scene {
        WindowGroup {
            HomePage(odinVM: odinVM)
                .task {
                    do {
                        let blocks = try await dataManager.load()
                        if blocks.isEmpty {
                            odinVM.load(Stub().load())
                        } else {
                            odinVM.load(blocks)
                        }
                        
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive {
                        Task {
                            do {
                                let blocks = odinVM.model
                                _ = try await dataManager.save(blocks)
                            } catch {
                                fatalError(error.localizedDescription)
                            }
                        }
                    }
                }
        }
    }
}
