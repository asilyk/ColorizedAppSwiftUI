//
//  ColorView.swift
//  ColorizedAppSwiftUI
//
//  Created by Alexander on 25.04.2022.
//

import SwiftUI

struct ColorView: View {
    let redColor: Double
    let greenColor: Double
    let blueColor: Double

    var body: some View {
        Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.white)
            )
            .cornerRadius(16)
    }
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorView(redColor: 123, greenColor: 14, blueColor: 46)
//    }
//}
