//
//  BlocksView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageModel

struct BlocksView: View {
    var blocks: [Block]

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label("Blocs", systemImage: "doc.on.doc.fill")
                .font(.title)
            Text("Vous devez avoir la moyenne à chacun de ces blocs pour avoir vôtre diplôme.")
                .padding(.bottom, 12)

            LazyVStack(spacing: 4) {
                ForEach(blocks) { block in
                    BlockRowView(block: block)
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
        BlocksView(blocks: loadBlocks())
            .previewLayout(.sizeThatFits)
    }
}
