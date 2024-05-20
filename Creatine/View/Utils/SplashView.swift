//
//  LoaderView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import SwiftUI

struct SplashView: View {
    @State private var scale = 0.7
        @Binding var isActive: Bool
        var body: some View {
            VStack {
                VStack {
                    Image("splash")
                        .resizable()
                        .frame(height: 100)
                        .frame(width: 100)
                        .border(Color.gray)
                        .cornerRadius(7)
                    Text("Creatine App")
                        .font(.system(size: 20))
                }.scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeIn(duration: 0.7)) {
                        self.scale = 0.9
                    }
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
}

//#Preview {
//    @State static var isActive = false
//    LoaderView(isActive: isActive)
//}
