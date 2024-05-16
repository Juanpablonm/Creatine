//
//  LoaderView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import SwiftUI

struct LoaderView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth: 8.0,lineCap: .round,lineJoin:.round))
                .frame(width: 60, height: 40)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: UUID())
                .onAppear {
                    self.isAnimating = true
                }
        }
    }
}

#Preview {
    LoaderView()
}
