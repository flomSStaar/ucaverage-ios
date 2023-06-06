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
    @ObservedObject var unitVM: UnitVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(unitVM.name)
                Spacer()
                Text("\(unitVM.coef)")
            }
            
            MarkSlider(mark: .constant(unitVM.average))
            Divider()
        }
    }
}

struct UESummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let ue = loadUnits()[0]
        NavigationStack {
            UESummaryView(unitVM: UnitVM(withModel: ue))
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
