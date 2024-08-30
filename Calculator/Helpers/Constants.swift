//
//  Constants.swift
//  Calculator
//
//  Created by Umman on 30.08.24.
//

import Foundation

public class Constants
{
    static let padding: CGFloat = 10.0
    
    static let calcButtons =
    [
        [CalcButton(color: .lightGray, buttonText: "AC"),
         CalcButton(color: .lightGray, action: .plusMinus),
         CalcButton(color: .lightGray, buttonText: "%"),
         CalcButton(color: .orange, action: .divide)],
        
        [CalcButton(color: .darkGray, buttonText: "7"),
         CalcButton(color: .darkGray, buttonText: "8"),
         CalcButton(color: .darkGray, buttonText: "9"),
         CalcButton(color: .orange, action: .multiply)],
        
        [CalcButton(color: .darkGray, buttonText: "4"),
         CalcButton(color: .darkGray, buttonText: "5"),
         CalcButton(color: .darkGray, buttonText: "6"),
         CalcButton(color: .orange, action: .subtract)],
        
        [CalcButton(color: .darkGray, buttonText: "1"),
         CalcButton(color: .darkGray, buttonText: "2"),
         CalcButton(color: .darkGray, buttonText: "3"),
         CalcButton(color: .orange, action: .add)],
        
        [CalcButton(color: .darkGray, buttonText: "0"),
         CalcButton(color: .darkGray, buttonText: "."),
         CalcButton(color: .orange, action: .equals)]
    ]
}

enum CalcColor: String
{
    case lightGray = "customLightGray"
    case darkGray = "customDarkGray"
    case orange = "customOrange"
}

public enum Action: String
{
    case plusMinus = "plus.forwardslash.minus"
    case divide = "divide"
    case multiply = "multiply"
    case subtract = "minus"
    case add = "plus"
    case equals = "equal"
}

extension String
{
    func addNumberCommas() -> String
    {
        let arr = self.components(separatedBy: ".")
        if arr.first?.count ?? 0 < 4
        {
            return self
        }
        else
        {
            var string = arr.first ?? ""
            for i in stride(from: string.count - 3, to: 0, by: -3)
            {
                let index = string.index(string.startIndex, offsetBy: i)
                string.insert(".", at: index)
            }
            
            if arr.count > 1
            {
                let endComponent = arr[1]
                string.append(".")
                string.append(endComponent)
            }
            
            return string
        }
    }
}
