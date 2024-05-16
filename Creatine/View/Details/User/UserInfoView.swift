//
//  UserInfoView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct UserInfoView: View {
    var tag: String
    var info: String
    var body: some View {
        HStack {
            Text(tag.capitalized)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(info)
        }
    }
}

#Preview {
    UserInfoView(tag: "name", info: "Juan")
}
