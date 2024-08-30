//
//  CalcButton.swift
//  Calculator
//
//  Created by Umman on 30.08.24.
//

import Foundation

public struct CalcButton: Identifiable, Hashable
{
    public let id: String = UUID().uuidString
    let color: CalcColor
    var buttonText: String? = nil
    var action: Action? = nil
    
    public static func == (lhs: CalcButton, rhs: CalcButton) -> Bool
    {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(id)
    }
}
