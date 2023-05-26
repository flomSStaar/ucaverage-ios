//
//  UESummaryView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct UESummaryView: View {
    @ObservedObject var ueVM: UEVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(ueVM.original.name)
                Spacer()
                Text("\(ueVM.original.coef)")
            }
            
            
            HStack {
                Rectangle()
                    .frame(width: 100, height: 16)
                    .foregroundColor(.green)
                    .cornerRadius(10)
                Text(String(format: "%.2f", ueVM.original.average))
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
            UESummaryView(ueVM: UEVM(withUE: ue))
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
