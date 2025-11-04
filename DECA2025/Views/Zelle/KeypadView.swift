//
//  KeypadView.swift
//  DECA2025
//
//  Created by Harri SN on 1/20/25.
//

import SwiftUI

struct NumpadView: View {
    
    @StateObject private var viewModel = NumpadViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0) {
            NumpadHeader()
            Spacer()
            HStack(spacing: 0){
                Text(viewModel.currency)
                    .font(.system(size: 96, weight: .semibold))
                
            }
            .scaleEffect(viewModel.arrayScale)
            .modifier(ShakeEffect(animatableData: viewModel.shake ? 0 : 1))
            .animation(.easeInOut, value: viewModel.shake)
            .frame(maxWidth: .infinity)
            Spacer()
            CurrencySelector() /*Dummy*/
            CustomNumpad(viewModel: viewModel)
            BottomActions(viewModel: viewModel)
                .padding(.bottom)
        }
        .foregroundStyle(.white)
        .background(Color("Truist"))
    }
}



struct CustomNumpad: View {
    
    @ObservedObject var viewModel: NumpadViewModel
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(1..<10) { number in
                    KeyPad(viewModel: viewModel, keyType: .number(number))
                }
                KeyPad(viewModel: viewModel, keyType: .dot)
                KeyPad(viewModel: viewModel, keyType: .number(0))
                KeyPad(viewModel: viewModel, keyType: .delete)
            }
            .padding(.vertical)
        }
    }
}


public struct ShakeEffect: GeometryEffect {
    private let amount: CGFloat = 10
    private let shakesPerUnit: CGFloat = 5
    public var animatableData: CGFloat

    public init(animatableData: CGFloat) {
        self.animatableData = animatableData
    }
    
    public func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: self.amount * sin(self.animatableData * .pi * self.shakesPerUnit),
                y: 0.0
            )
        )
    }
}


// Misc Assets...
struct BottomButtonLabel: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.custom("TruistTrio-Regular", size: 20))
            .fontWeight(.bold)
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(Color.black)
            .clipShape(Capsule())
    }
}


struct CurrencySelector: View {
    var body: some View {
        HStack(spacing: 6){
            Text("USD")
                .font(.custom("TruistTrio-Regular", size: 20))
            Image(systemName: "chevron.down")
                .font(.custom("TruistTrio-Regular", size: 16))

        }
        .padding(.vertical, 10)
        .padding(.leading, 20)
        .padding(.trailing, 12)
        .background(Color.black)
        .clipShape(Capsule())
    }
}

struct NumpadHeader: View {
    var body: some View {
        HStack{
            Image(systemName: "viewfinder")
                .font(.system(size: 26, weight: .bold))
            Spacer()
            Image(systemName: "person.crop.circle")
                .font(.system(size: 30))
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 28)
    }
}

struct BottomActions: View {
    
    @ObservedObject var viewModel: NumpadViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Button{
                // ...
            } label: {
                BottomButtonLabel(title: "Request")
            }
            Button{
                // ...
            } label: {
                BottomButtonLabel(title: "Pay")
            }
        }
        .padding(.horizontal, 28)
    }
}
