//
//  ContentView.swift
//  MobCompW3
//
//  Created by MacBook Pro on 05/10/23.
//

import SwiftUI

struct Content: View {
    @ObservedObject var calculator: Calculator
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text(String(calculator.input))
                    .font(.system(size: 60))
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
            }
            HStack {
                ControlButton(calculator: calculator, kind: ControlButtonKind.Clear)
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Operator("power", calculator.chain.last == "power"))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Operator("root", calculator.chain.last == "root"))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Operator("divide", calculator.chain.last == "divide"))
            }
            HStack {
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("7", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("8", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("9", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Operator("multiply", calculator.chain.last == "multiply"))
            }
            HStack {
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("4", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("5", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("6", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Operator("subtract", calculator.chain.last == "subtract"))
            }
            HStack {
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("1", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("2", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("3", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Operator("add", calculator.chain.last == "add"))
            }
            HStack {
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number("0", true))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Number(".", false))
                Spacer()
                ControlButton(calculator: calculator, kind: ControlButtonKind.Equal)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .background(.black)
    }
}


struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content(calculator: calculator)
    }
}
