//
//  ContentView.swift
//  UCAverageApp
//
//  Created by etudiant on 24/05/2023.
//

import SwiftUI
import UCAverageModel

struct ContentView: View {
    var blocks: [Block] = loadBlocks()
    var ues: [UE] = loadUEs()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                BlocksView(blocks: blocks)
                    .padding(.horizontal, 10)
                
                Divider()
                    .padding(.vertical, 10)
                
                UEListView(ues: ues)
                    .padding(.horizontal, 10)
            }
            .navigationTitle("Calculette")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
