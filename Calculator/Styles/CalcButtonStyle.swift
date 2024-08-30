//
//  CalcButtonStyle.swift
//  Calculator
//
//  Created by Umman on 30.08.24.
//

import SwiftUI

struct CalcButtonStyle: ButtonStyle
{
    let size: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    var width: Bool = false
    
    func makeBody(configuration: Configuration) -> some View
    {
        configuration.label
            .font(.system(size: 30.0, weight: .medium))
            .frame(width: size, height: size)
            .frame(maxWidth: width ? .infinity: size, alignment: .leading)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .overlay
        {
            if configuration.isPressed
            {
                Color(white: 1.0, opacity: 0.25)
            }
        }
        .clipShape(Capsule())
    }
}

#Preview
{
    Button {}
    label: {Text("0")}
        .buttonStyle(CalcButtonStyle(size: 50.0, backgroundColor: .customOrange, foregroundColor: .white))
}
