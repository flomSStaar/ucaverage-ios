//
//  BlockRowView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct BlockRowView: View {
    //var block: Block
    var blockVM: BlockVM

    var body: some View {
        HStack {
            Label(blockVM.original.name, systemImage: "doc.on.doc.fill")
            Spacer()
            Text(String(format: "%.2f", blockVM.original.average))
            Image(systemName: "graduationcap.circle.fill")
        }
    }
}

struct BlockRowView_Previews: PreviewProvider {
    static var previews: some View {
        let block = loadBlocks()[0]

        BlockRowView(blockVM: BlockVM(withBlock: block))
    }
}
