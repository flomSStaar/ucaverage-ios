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
    @ObservedObject var homeVM: HomeVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                BlocksView(blocks: homeVM.blocks)
                    .padding(.horizontal, 10)
                
                Divider()
                    .padding(.vertical, 10)
                
                UEListView(ues: homeVM.ues)
                    .padding(.horizontal, 10)
            }
            .navigationTitle("Calculette")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        let homeVM: HomeVM = HomeVM(withBlocks: loadBlocks(), andUEs: loadUEs())

        HomePage(homeVM: homeVM)
    }
}
