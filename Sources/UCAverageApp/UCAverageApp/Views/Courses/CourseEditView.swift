//
//  CourseEditView.swift
//  UCAverageApp
//
//  Created by etudiant on 30/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct CourseEditView: View {
    @ObservedObject var courseVM: CourseVM
    
    var body: some View {
        VStack(spacing: 4) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Matière")
                    .fontWeight(.bold)
                TextField("Nom", text: $courseVM.name)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Coefficient")
                    .fontWeight(.bold)
                TextField("Coefficient",
                          value: $courseVM.coef,
                          format: .number)
            }
        }
    }
}

struct CourseEditView_Previews: PreviewProvider {
    static var previews: some View {
        let course = loadCourses()[0]
        CourseEditView(courseVM: CourseVM(withModel: course))
    }
}
