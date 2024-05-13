//
//  UserInfoView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct UserInfoView: View {
    var info: String
    var body: some View {
        HStack {
            Text(info.capitalized)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(info) //here comes name
        }
    }
}

#Preview {
    UserInfoView(info: "name")
}
