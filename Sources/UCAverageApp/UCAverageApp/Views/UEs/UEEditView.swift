//
//  UEEditView.swift
//  UCAverageApp
//
//  Created by etudiant on 30/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct UEEditView: View {
    @ObservedObject var ueVM: UEVM
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                Text("Edition d'une UE")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Nom de l'UE")
                        .fontWeight(.bold)
                    TextField("Nom", text: $ueVM.name)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Coefficient de l'UE")
                        .fontWeight(.bold)
                    TextField("Coefficient",
                              value: $ueVM.coef,
                              format: .number)
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                HStack {
                    Text("Liste des Matières")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut) {
                            ueVM.addCourse(withName: "Nouvelle matière", andCoef: 1, andMark: 0)
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                    }
                }

                LazyVStack(spacing: 12) {
                    ForEach(ueVM.courses) { courseVM in
                        VStack {
                            HStack(spacing: 16) {
                                CourseEditView(courseVM: courseVM)
                                
                                Button {
                                    withAnimation(.easeInOut) {
                                        ueVM.removeCourse(withId: courseVM.id)
                                    }
                                } label: {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                            
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

struct UEEditView_Previews: PreviewProvider {
    static var previews: some View {
        let ue = loadUEs()[0]
        UEEditView(ueVM: UEVM(withModel: ue))
    }
}
