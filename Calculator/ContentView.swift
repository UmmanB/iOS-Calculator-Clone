//
//  ContentView.swift
//  Calculator
//
//  Created by Umman on 30.08.24.
//

import SwiftUI

struct ContentView: View
{
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View
    {
        VStack(spacing: 0.0)
        {
            Spacer()
            HStack
            {
                Spacer()
                
                Text(viewModel.display.addNumberCommas())
                    .font(.system(size: 90.0, weight: .light))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.trailing)
            }
            
            ForEach(Constants.calcButtons, id: \.self) { row in
                HStack
                {
                    ForEach(row, id: \.id) { button in
                        CalcButtonView(calcButton: button)
                        {
                            viewModel.buttonPressed(button)
                        }
                        .environmentObject(viewModel)
                    }
                }
                .padding(.bottom, Constants.padding)
            }
        }
        .padding()
        .background(.black)
    }
}

#Preview { ContentView() }
