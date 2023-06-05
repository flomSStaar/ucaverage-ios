//
//  MarkSlider.swift
//  UCAverageApp
//
//  Created by etudiant on 04/06/2023.
//

import SwiftUI
import UCAverageViewModel

struct CourseMarkSlider: View {
    @Binding var courseMark: Float
    @Binding var isEditable: Bool
    
    var body: some View {
        HStack {
            SimpleSlider(value: $courseMark, isEnabled: isEditable)
                .frame(height: 20)
            Spacer()
            Text(String(format: "%.2f", courseMark))
                .frame(width: 55)
        }
    }
}

struct CourseMarkSlider_Previews: PreviewProvider {
    static var previews: some View {
        CourseMarkSlider(courseMark: .constant(19), isEditable: .constant(true))
    }
}
