//
//  UEListView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageModel
import UCAverageStub
import UCAverageViewModel

struct UEListView: View {
    var ues: [UE]

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Label("UEs", systemImage: "doc.fill")
                .font(.title)
            Text("Détail des UEs")
                .padding(.bottom, 12)

            LazyVStack(spacing: 8) {
                ForEach(ues) { ue in
                    HStack(spacing: 8) {
                        UESummaryView(ueVM: UEVM(withUE: ue))
                        
                        NavigationLink {
                            UEDetailPage(ueVM: UEVM(withUE: ue))
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
        NavigationStack {
            UEListView(ues: loadUEs())
        }
        .previewLayout(.sizeThatFits)
    }
}
