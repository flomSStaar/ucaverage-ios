//
//  UEDetailPage.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageModel
import UCAverageViewModel

struct UEDetailPage: View {
    var ue: UE

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                UESummaryView(ue: ue)
                    .padding(.top, 16)

                VStack(alignment: .leading, spacing: 8) {
                    Label("coefficient : \(ue.coef)", systemImage: "xmark.circle.fill")
                    Label("Détails des notes", systemImage: "note.text")
                }

                LazyVStack {
                    ForEach(ue.courses) { course in
                        CourseView(courseVM: CourseVM(withCourse: course))
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle(ue.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    
                } label: {
                    Text("Edit")
                }
            }
        }
    }
}

struct UEDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        let ue = loadUEs()[0]
        NavigationStack {
            UEDetailPage(ue: ue)
        }
    }
}
