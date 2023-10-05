//
//  NumberButton.swift
//  MobCompW3
//
//  Created by MacBook Pro on 05/10/23.
//

import SwiftUI

struct ControlButton: View {
    let kind: ControlButtonKind
    
    var dimension = (UIScreen.main.bounds.size.width - 70) / 4
    
    var body: some View {
        Button {
            
        } label: {
            switch kind {
            case let .Number(word, extended):
                Text(word)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: extended ? dimension * 2 + 10 : dimension, height: dimension)
                    .background(.gray, in: Capsule())
            case let .Operator(icon):
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 7.5)
                    .frame(width: dimension, height: dimension)
                    .background(Color(red: 1.0, green: 0.953, blue: 0.459), in: Capsule())
                    
            case .Clear:
                Text("AC")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(width: dimension, height: dimension)
                    .background(Color(red: 1.0, green: 0.953, blue: 0.459, opacity: 0.75), in: Capsule())
            }
        }
    }
}

enum ControlButtonKind {
    case Number(String, Bool)
    case Operator(String)
    case Clear
}


struct ControlButton_Previews: PreviewProvider {
    static let keywords = ["1", "2"]
    static var previews: some View {
        ControlButton(kind: ControlButtonKind.Operator("root"))
    }
}
