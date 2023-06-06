//
//  UEListView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageStub
import UCAverageViewModel

struct UEListView: View {
    @ObservedObject var blockVM: BlockVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label("UEs", systemImage: "doc.fill")
                .font(.title)
            Text("Détail des UEs")
                .padding(.bottom, 12)

            LazyVStack(spacing: 8) {
                ForEach(blockVM.units) { unitVM in
                    HStack(spacing: 8) {
                        UESummaryView(unitVM: unitVM)

                        NavigationLink {
                            UEDetailPage(unitVM: unitVM)
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }

                        Divider()
                    }
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(Colors.backgroundAccent)
        .cornerRadius(16)
    }
}

struct UEListView_Previews: PreviewProvider {
    static var previews: some View {
        let block = loadBlocks()[0]
        
        NavigationStack {
            UEListView(blockVM: BlockVM(withModel: block))
        }
        .previewLayout(.sizeThatFits)
    }
}
