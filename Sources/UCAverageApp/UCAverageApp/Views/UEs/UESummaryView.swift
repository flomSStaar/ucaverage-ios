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
                Text(ueVM.name)
                Spacer()
                Text("\(ueVM.coef)")
            }
            
            MarkSlider(mark: .constant(ueVM.average))
            Divider()
        }
    }
}

struct UESummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let ue = loadUEs()[0]
        NavigationStack {
            UESummaryView(ueVM: UEVM(withModel: ue))
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
