//
//  UserView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct UserView: View {
    let imageNames = ["person1", "person2", "person3", "person4", "person5"]
    func randomImageName() -> String {
            let randomIndex = Int.random(in: 0..<imageNames.count)
            return imageNames[randomIndex]
        }

    var body: some View {
        VStack(alignment: .leading) {
            Text("User")
                .font(.title2.weight(.medium))
            HStack {
                Image(randomImageName())
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay {
                        Circle().stroke(.white, lineWidth: 3)
                    }
                    .shadow(radius: 6)
                
                VStack(alignment: .leading) {
                    UserInfoView(info: "name") //here comes name
                    UserInfoView(info: "email") //here comes email
                    UserInfoView(info: "phone") //here comes phone
                    UserInfoView(info: "website") //here comes website
                }
            }
        }
        .padding()
    }
}

#Preview {
    UserView()
}
