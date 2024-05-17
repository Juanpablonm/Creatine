//
//  FavoriteButtonView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 16/5/24.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
                .font(.system(size: 25))
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
