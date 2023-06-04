//
//  SimpleSlider.swift
//  UCAverageApp
//
//  Created by etudiant on 04/06/2023.
//

import SwiftUI

// slider from https://stackoverflow.com/a/58288003
struct SimpleSlider: View {
    @Binding var value: Float
    var isEnabled: Bool
    var thumbColor: Color = .accentColor
    
    var maxValue: Int = 20
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.gray)
                Rectangle()
                    .foregroundColor(thumbColor)
                    .clipShape(Capsule())
                    .frame(width: geometry.size.width * CGFloat(self.value / Float(maxValue)))
            }
            .clipShape(Capsule())
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged{ gesture in
                    if isEnabled {
                        updateValue(withGesture: gesture, andGeometry: geometry)
                    }
                })
        }
    }
    
    private func updateValue(withGesture gesture: DragGesture.Value, andGeometry geometry: GeometryProxy) {
        let percent = Float(gesture.location.x / geometry.size.width)
        let newValue: Float = percent * Float(maxValue)
        self.value = min(max(0, newValue), Float(maxValue))
    }
}

struct SimpleSlider_Previews: PreviewProvider {
    static var previews: some View {
        SimpleSlider(value: .constant(18), isEnabled: true)
            .frame(height: 40)
            .previewLayout(.sizeThatFits)
    }
}
