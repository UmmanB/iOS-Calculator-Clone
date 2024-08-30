//
//  CalcButtonView.swift
//  Calculator
//
//  Created by Umman on 30.08.24.
//

import SwiftUI

struct CalcButtonView: View
{
    @EnvironmentObject var viewModel: ContentViewModel
    
    let calcButton: CalcButton
    let action: (() -> ())?
    
    var width: Bool
    {
        if let text = calcButton.buttonText
        {
            return text == "0"
        }
        else
        {
            return false
        }
    }
    
    var backgroundColor: Color
    {
        if let action = calcButton.action,
           action == viewModel.action,
           viewModel.shouldClear,
           viewModel.newAction
        {
            return .white
        }
        else
        {
            return Color(calcButton.color.rawValue)
        }
    }
    
    var foregroundColor: Color
    {
        if let action = calcButton.action,
           action == viewModel.action,
           viewModel.shouldClear,
           viewModel.newAction
        {
            return Color("customOrange")
        }
        else if calcButton.color == .lightGray
        {
            return .black
        }
        else
        {
            return .white
        }
    }
    
    var body: some View
    {
        Button
        {
            action?()
        }
    label:
        {
            if let text = calcButton.buttonText
            {
                if text == "AC"
                {
                    if viewModel.display == "0"
                    {
                        Text(text)
                    }
                    else
                    {
                        Text("C")
                    }
                }
                else
                {
                    Text(text)
                }
            }
            
            else if let action = calcButton.action
            {
                Image(systemName: action.rawValue)
            }
        }
        .buttonStyle(CalcButtonStyle(size: getSize(), backgroundColor: backgroundColor, foregroundColor: foregroundColor, width: width))
    }
    
    private func getSize() -> CGFloat
    {
        let screenWidth = UIScreen.main.bounds.width
        let buttonCount: CGFloat = 4
        let spacingCount = buttonCount + 1
        return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
    }
}

#Preview {CalcButtonView(calcButton: CalcButton(color: .orange, buttonText: "0"), action: nil)}
