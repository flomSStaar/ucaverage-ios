//
//  UEDetailPage.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct UEDetailPage: View {
    @ObservedObject var unitVM: UnitVM

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                UESummaryView(unitVM: unitVM)
                    .padding(.top, 16)

                VStack(alignment: .leading, spacing: 8) {
                    Label("coefficient : \(unitVM.coef)", systemImage: "xmark.circle.fill")
                    Label("Détails des notes", systemImage: "note.text")
                }

                LazyVStack {
                    ForEach(unitVM.courses) { courseVM in
                        CourseView(courseVM: courseVM)
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle(unitVM.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    unitVM.onEditing()
                } label: {
                    Text("Edit")
                }
            }
        }
        .sheet(isPresented: $unitVM.isEditing) {
            NavigationStack {
                UEEditView(unitVM: unitVM.copy!)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                unitVM.onEdited()
                            }
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                unitVM.onEdited(isCancelled: true)
                            }
                        }
                    }
            }
            .padding()
        }
    }
}

struct UEDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        let ues = loadUnits()
        let ue = ues[0]
        NavigationStack {
            UEDetailPage(unitVM: UnitVM(withModel: ue))
        }
    }
}
