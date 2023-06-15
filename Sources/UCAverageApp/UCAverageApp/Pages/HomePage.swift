//
//  ContentView.swift
//  UCAverageApp
//
//  Created by etudiant on 24/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct HomePage: View {
    @ObservedObject var odinVM: OdinVM

    var body: some View {
        NavigationStack {
            ScrollView {
                BlocksView(odinVM: odinVM)
                    .padding(.horizontal, 10)
                
                Divider()
                    .padding(.vertical, 10)
                
                let totalBlockVM = odinVM.blocks.first { $0.name == "Total" }
                if let totalBlockVM {
                    UEListView(blockVM: totalBlockVM)
                        .padding(.horizontal, 10)
                } else {
                    Text("Aucune UE à afficher")
                }
                
            }
            .navigationTitle("Calculette")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        let blocks = getStub()
        HomePage(odinVM: OdinVM(from: blocks))
    }
}
