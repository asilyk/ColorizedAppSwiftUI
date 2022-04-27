//
//  ColorSliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by Alexander on 25.04.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double

    @State private var stringValue = ""

    let color: Color
    let focusedColor: Color?

    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 48)

            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: value) { newValue in
                    stringValue = "\(lround(newValue))"
                }
            TextFieldView(
                value: $value,
                stringValue: $stringValue,
                color: color,
                focusedColor: focusedColor
            )
        }
        .onAppear {
            stringValue = "\(lround(value))"
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(143), color: .red, focusedColor: nil)
    }
}
