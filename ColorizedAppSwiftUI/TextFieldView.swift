//
//  TextFieldView.swift
//  ColorizedAppSwiftUI
//
//  Created by Alexander on 27.04.2022.
//

import SwiftUI

struct TextFieldView: View {
    @State private var alertPresented = false

    @Binding var value: Double
    @Binding var stringValue: String

    let color: Color
    let focusedColor: Color?

    var body: some View {
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


struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(12), stringValue: .constant("12"), color: .red, focusedColor: nil)
    }
}
