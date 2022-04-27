//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Alexander on 22.04.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)

    @FocusState var focusedColor: Color?

    var body: some View {
        ZStack {
            Color(.systemGray)
                .ignoresSafeArea()
                .onTapGesture { focusedColor = nil }
            VStack(spacing: 48) {
                ColorView(red: redValue, green: greenValue, blue: blueValue)

                Spacer()

                ColorSliderView(value: $redValue, color: .red, focusedColor: focusedColor)
                    .focused($focusedColor, equals: .red)
                ColorSliderView(value: $greenValue, color: .green, focusedColor: focusedColor)
                    .focused($focusedColor, equals: .green)
                ColorSliderView(value: $blueValue, color: .blue, focusedColor: focusedColor)
                    .focused($focusedColor, equals: .blue)

                Spacer()
            }
            .padding()
        }
        .keyboardType(.decimalPad)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") { focusedColor = nil }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}
