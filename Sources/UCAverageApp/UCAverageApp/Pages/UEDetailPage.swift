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
    @ObservedObject var uesVM: UEsVM
    @ObservedObject var ueVM: UEVM

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                UESummaryView(ueVM: ueVM)
                    .padding(.top, 16)

                VStack(alignment: .leading, spacing: 8) {
                    Label("coefficient : \(ueVM.original.coef)", systemImage: "xmark.circle.fill")
                    Label("Détails des notes", systemImage: "note.text")
                }

                LazyVStack {
                    ForEach(ueVM.original.courses) { course in
                        CourseView(courseVM: CourseVM(withCourse: course))
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle(ueVM.original.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    ueVM.onEditing()
                } label: {
                    Text("Edit")
                }
            }
        }
        .sheet(isPresented: $ueVM.isEditing) {
            NavigationStack {
                UEEditView(ueVM: ueVM)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                ueVM.onEdited()
                                uesVM.update(with: ueVM)
                            }
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                ueVM.onEdited(isCancelled: true)
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
        let ues = loadUEs()
        let ue = ues[0]
        NavigationStack {
            UEDetailPage(uesVM: UEsVM(withUEs: ues), ueVM: UEVM(withUE: ue))
        }
    }
}
