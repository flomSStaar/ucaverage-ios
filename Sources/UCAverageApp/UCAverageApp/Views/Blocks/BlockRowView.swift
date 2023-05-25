//
//  BlockRowView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageModel

struct BlockRowView: View {
    var block: Block

    var body: some View {
        HStack {
            Label(block.name, systemImage: "doc.on.doc.fill")
            Spacer()
            Text(String(format: "%.2f", block.average))
            Image(systemName: "graduationcap.circle.fill")
        }
    }
}

struct BlockRowView_Previews: PreviewProvider {
    static var previews: some View {
        let block = loadBlocks()[0]
        BlockRowView(block: block)
    }
}
