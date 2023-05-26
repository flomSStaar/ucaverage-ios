//
//  CourseView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageViewModel
import UCAverageStub

struct CourseView: View {
    @ObservedObject var courseVM: CourseVM

    var body: some View {
        HStack(spacing: 16) {
            Button {
                courseVM.onToggleEdit()
            } label: {
                Image(systemName: courseVM.isEditing ? "lock.open" : "lock")
                    .frame(width: 24)
            }
            
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
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        let course = loadCourses()[0]
        
        CourseView(courseVM: CourseVM(withCourse: course))
            .previewLayout(.sizeThatFits)
    }
}
