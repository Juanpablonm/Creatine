//
//  UserView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct UserView: View {
    var user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text("User")
                .font(.title2.weight(.medium))
            HStack {
                PhotoView(size: 95)
                VStack(alignment: .leading) {
                    UserInfoView(tag: "name:",info: user.name ?? "")
                    UserInfoView(tag: "email:",info: user.email ?? "")
                    UserInfoView(tag: "phone:",info: user.phone ?? "")
                    UserInfoView(tag: "website:",info: user.website ?? "")
                }
            }
        }
        .padding()
    }
}

#Preview {
    UserView(user: User())
}
