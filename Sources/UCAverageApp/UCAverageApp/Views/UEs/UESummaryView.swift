//
//  UESummaryView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageModel

struct UESummaryView: View {
    var ue: UE
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(ue.name)
                Spacer()
                Text("\(ue.coef)")
            }
            
            
            HStack {
                Rectangle()
                    .frame(width: 100, height: 16)
                    .foregroundColor(.green)
                    .cornerRadius(10)
                Text(String(format: "%.2f", ue.average))
                Spacer()
            }
            Divider()
        }
    }
}

struct UESummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let ue = loadUEs()[0]
        NavigationStack {
            UESummaryView(ue: ue)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
