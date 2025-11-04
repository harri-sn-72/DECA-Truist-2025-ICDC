//
//  Keypad.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//

import SwiftUI

enum KeyType {
    case number(Int)
    case delete
    case dot
}

struct KeyPad: View {
    
    @ObservedObject var viewModel: NumpadViewModel
    let keyType: KeyType
    
    var body: some View {
        Button{
            withAnimation(.spring(response: 0.3,
                                  dampingFraction: 0.65,
                                  blendDuration: 0.9)) {
                viewModel.handleKeyPress(keyType)
            }
        } label: {
            switch keyType {
            case .number(let number):
                Text("\(number)")
                    .font(.custom("TruistTrio-Bold", size: 24))
            case .delete:
                Image(systemName: "chevron.left")
                    .font(.custom("TruistTrio-Bold", size: 20))

            case .dot:
                Text(".")
                    .font(.custom("TruistTrio-Bold", size: 20))

            }
        }
        .frame(width: 72, height: 72)
        .contentShape(Rectangle())
    }
}


