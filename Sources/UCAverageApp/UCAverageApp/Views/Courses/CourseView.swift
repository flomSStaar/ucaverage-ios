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
            
            CourseItemView(courseVM: courseVM)
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
