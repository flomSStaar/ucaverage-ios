//
//  MarkSlider.swift
//  UCAverageApp
//
//  Created by etudiant on 04/06/2023.
//

import SwiftUI

struct MarkSlider: View {
    @Binding var mark: Float
    var isEditable: Bool = false
    
    private var sliderColor: Color {
        if mark >= 10 {
            return .green
        } else {
            return .red
        }
    }
    
    var body: some View {
        HStack {
            SimpleSlider(value: $mark, isEnabled: isEditable, thumbColor: sliderColor)
            Spacer()
            Text(String(format: "%.2f", mark))
                .frame(width: 55)
        }
    }
}

struct MarkSlider_Previews: PreviewProvider {
    static var previews: some View {
        MarkSlider(mark: .constant(12), isEditable: false)
    }
}
