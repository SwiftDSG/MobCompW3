//
//  ContentView.swift
//  MobCompW3
//
//  Created by MacBook Pro on 05/10/23.
//

import SwiftUI

struct Content: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            
            Spacer()
            
            HStack {
                ControlButton(kind: ControlButtonKind.Clear)
                Spacer()
                ControlButton(kind: ControlButtonKind.Operator("power"))
                Spacer()
                ControlButton(kind: ControlButtonKind.Operator("root"))
                Spacer()
                ControlButton(kind: ControlButtonKind.Operator("divide"))
            }
            HStack {
                ControlButton(kind: ControlButtonKind.Number("7", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Number("8", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Number("9", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Operator("multiply"))
            }
            HStack {
                ControlButton(kind: ControlButtonKind.Number("4", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Number("5", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Number("6", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Operator("subtract"))
            }
            HStack {
                ControlButton(kind: ControlButtonKind.Number("1", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Number("2", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Number("3", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Operator("add"))
            }
            HStack {
                ControlButton(kind: ControlButtonKind.Number("0", true))
                Spacer()
                ControlButton(kind: ControlButtonKind.Number(".", false))
                Spacer()
                ControlButton(kind: ControlButtonKind.Equal)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .background(.black)
    }
}


struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content()
    }
}
