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
    
    @ObservedObject var uesVM: UEsVM
    @ObservedObject var blocksVM: BlocksVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                BlocksView(blocksVM: blocksVM)
                    .padding(.horizontal, 10)
                
                Divider()
                    .padding(.vertical, 10)
                
                UEListView(uesVM: uesVM)
                    .padding(.horizontal, 10)
            }
            .navigationTitle("Calculette")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        let homeVM: HomeVM = HomeVM(withBlocks: loadBlocks(), andUEs: loadUEs())
        
        let uesVM: UEsVM = UEsVM(withUEs: loadUEs())
        let blocksVM: BlocksVM = BlocksVM(withBlocks: loadBlocks())
        
        HomePage(homeVM: homeVM, uesVM: uesVM, blocksVM: blocksVM)
    }
}
