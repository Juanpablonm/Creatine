//
//  PhotoView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 15/5/24.
//

import SwiftUI

struct PhotoView: View {
    var size: CGFloat
    var border: CGFloat = 3
    let imageNames = ["person1", "person2", "person3", "person4", "person5", "person6", "person7", "person8", "person9", "person10"]
    func randomImageName() -> String {
            let randomIndex = Int.random(in: 0..<imageNames.count)
            return imageNames[randomIndex]
        }
    var body: some View {
        Image(randomImageName())
            .resizable()
            .frame(width: size, height: size)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: border)
            }
            .shadow(radius: 6)
    }
}

#Preview {
    PhotoView(size: 60)
}
