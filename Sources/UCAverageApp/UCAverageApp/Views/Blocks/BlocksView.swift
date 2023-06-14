//
//  BlocksView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct BlocksView: View {
    @ObservedObject var odinVM: OdinVM

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label("Blocs", systemImage: "doc.on.doc.fill")
                .font(.title)
            Text("Vous devez avoir la moyenne à chacun de ces blocs pour avoir vôtre diplôme.")
                .padding(.bottom, 12)

            LazyVStack(spacing: 4) {
                ForEach(odinVM.blocks) { blockVM in
                    HStack {
                        Label(blockVM.name, systemImage: "doc.on.doc.fill")
                        Spacer()
                        Text(String(format: "%.2f", blockVM.average))
                        Image(systemName: "graduationcap.circle.fill")
                    }
//                    BlockRowView(blockVM: blockVM)
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(Colors.backgroundAccent)
        .cornerRadius(16)
        
    }
}

struct BlocksView_Previews: PreviewProvider {
    static var previews: some View {
        let blocks = getStub()
        
        BlocksView(odinVM: OdinVM(from: blocks))
            .previewLayout(.sizeThatFits)
    }
}
