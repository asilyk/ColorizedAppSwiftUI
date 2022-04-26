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
    @State private var alertPresented = false

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

            TextField("\(lround(value))", text: $stringValue)
                .textFieldStyle(.roundedBorder)
                .frame(width: 48)
                .onChange(of: focusedColor) { _ in
                    checkValue()
                }
                .alert("Wrong Number", isPresented: $alertPresented, actions: {}) {
                    Text("Enter number from 0 to 255")
                }
        }
        .onAppear {
            stringValue = "\(lround(value))"
        }
    }

    private func checkValue() {
        if focusedColor == color {
            if let newValue = Double(stringValue), 0...255 ~= newValue {
                value = newValue
            } else {
                alertPresented.toggle()
                stringValue = "\(lround(value))"
            }
        }
    }
}

//struct ColorSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorSliderView(value: .constant(143), color: .red)
//    }
//}
