//
//  CourseView.swift
//  UCAverageApp
//
//  Created by etudiant on 25/05/2023.
//

import SwiftUI
import UCAverageModel

struct CourseView: View {
    var course: Course

    var body: some View {
        HStack(spacing: 16) {
            Button {
                
            } label: {
                Image(systemName: "lock")
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(course.name)
                    Spacer()
                    Text("\(course.coef)")
                }
                
                HStack {
                    Rectangle()
                        .frame(width: 100, height: 16)
                        .foregroundColor(.green)
                        .cornerRadius(10)
                    Text(String(format: "%.2f", course.mark))
                }
            }
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        let course = loadCourses()[0]
        
        CourseView(course: course)
            .previewLayout(.sizeThatFits)
    }
}
