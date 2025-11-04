//
//  MessageLoadingView.swift
//  DECA2025
//
//  Created by Harri SN on 2/23/25.
//

import SwiftUI

struct MessageLoadingView: View {
    @State private var dots: [String] = "...".map { String($0)}
    @State private var showDots: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @State var runAnimations: Bool = true
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        HStack(spacing: 0) {
            if showDots {
                ForEach(dots.indices) { index in
                    Text(dots[index])
                        .font(.custom("TruistTrio-Xbold", size: 72))
                        .offset(y: counter == index ? -10 : 0)
                        .foregroundColor(Color("Truist"))
                }
            }
        }
        .transition(AnyTransition.scale.animation(.easeInOut))
        .onAppear {
            showDots.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring) {
                let lastIndex = dots.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops > 5 {
                        runAnimations = false
                    }
                    else {
                        counter += 1
                    }
                }
            }
        })
    }
}

#Preview {
    MessageLoadingView()
}
