//
//  ColorView.swift
//  ColorizedAppSwiftUI
//
//  Created by Alexander on 25.04.2022.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double

    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.white)
            )
            .cornerRadius(16)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 123, green: 14, blue: 46)
    }
}
