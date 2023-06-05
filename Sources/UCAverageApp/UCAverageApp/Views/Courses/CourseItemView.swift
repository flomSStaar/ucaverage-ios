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
    @ObservedObject var courseVM: CourseVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(courseVM.name)
                Spacer()
                Text("\(courseVM.coef)")
            }
            
            MarkSlider(mark: $courseVM.mark, isEditable: courseVM.isEditing)
                .frame(height: 24)
            
            Divider()
        }
    }
}

struct CourseItemView_Previews: PreviewProvider {
    static var previews: some View {
        let course = loadCourses()[0]
        CourseItemView(courseVM: CourseVM(withModel: course))
            .frame(height: 60)
            .previewLayout(.sizeThatFits)
    }
}
