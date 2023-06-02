//
//  CourseItemView.swift
//  UCAverageApp
//
//  Created by etudiant on 30/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct CourseItemView: View {
    var courseVM: CourseVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(courseVM.original.name)
                Spacer()
                Text("\(courseVM.original.coef)")
            }
            
            HStack {
                Rectangle()
                    .frame(width: 100, height: 16)
                    .foregroundColor(.green)
                    .cornerRadius(10)
                Text(String(format: "%.2f", courseVM.original.mark))
            }
            
            Divider()
        }
    }
}

struct CourseItemView_Previews: PreviewProvider {
    static var previews: some View {
        let course = loadCourses()[0]
        CourseItemView(courseVM: CourseVM(withCourse: course))
    }
}
