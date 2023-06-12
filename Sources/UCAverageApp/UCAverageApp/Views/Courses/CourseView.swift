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
    @State private var isEditing: Bool = true

    var body: some View {
        HStack(spacing: 16) {
            Button {
                isEditing.toggle()
            } label: {
                Image(systemName: isEditing ? "lock.open" : "lock")
                    .frame(width: 24)
            }
            
            CourseItemView(courseVM: courseVM, isEditable: isEditing)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        let course = loadCourses()[0]
        
        CourseView(courseVM: CourseVM(withModel: course))
            .previewLayout(.sizeThatFits)
    }
}
