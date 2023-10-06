//
//  NumberButton.swift
//  MobCompW3
//
//  Created by MacBook Pro on 05/10/23.
//

import SwiftUI

struct ControlButton: View {
    @ObservedObject var calculator: Calculator
    let kind: ControlButtonKind
    
    var dimension = (UIScreen.main.bounds.size.width - 70) / 4
    
    var body: some View {
        Button {
            switch kind {
            case let .Number(number, _):
                if number == "." {
                    calculator.add_input_point()
                } else {
                    calculator.add_input_number(number: number)
                }
            case let .Operator(name, _):
                calculator.calculate(kind: CalculatorCalculateKind.Normal)
                calculator.add_operator(name: name)
            case .Clear:
                calculator.clear()
            case .Equal:
                calculator.calculate(kind: CalculatorCalculateKind.Equal)
            }
        } label: {
            switch kind {
            case let .Number(word, extended):
                Text(word)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: extended ? dimension * 2 + 10 : dimension, height: dimension)
                    .background(.gray, in: Capsule())
            case let .Operator(name, selected):
                Image(name)
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 7.5)
                    .frame(width: dimension, height: dimension)
                    .background(Color(red: 1.0, green: 0.851, blue: 0.459, opacity: selected ? 0.75 : 1.0), in: Capsule())
            case .Clear:
                Text(calculator.input == "0" ? "AC" : "C")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: dimension, height: dimension)
                    .background(Color(hue: 0.001, saturation: 0.621, brightness: 0.958, opacity: 0.75), in: Capsule())
            case .Equal:
                Image("equal")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 7.5)
                    .frame(width: dimension, height: dimension)
                    .background(.white, in: Capsule())
            }
        }
    }
}

enum ControlButtonKind {
    case Number(String, Bool)
    case Operator(String, Bool)
    case Clear
    case Equal
}


struct ControlButton_Previews: PreviewProvider {
    static let keywords = ["1", "2"]
    static var previews: some View {
        
        VStack {
            HStack {
                Spacer()
            }
            
            Spacer()
            
            ControlButton(calculator: calculator, kind: ControlButtonKind.Operator("root", true))
            ControlButton(calculator: calculator, kind: ControlButtonKind.Clear)
            
            Spacer()
        }
        .background(.black)
    }
}
