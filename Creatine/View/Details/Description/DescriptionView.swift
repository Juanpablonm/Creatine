//
//  DescriptionView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct DescriptionView: View {
    var description: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.title2.weight(.medium))
            Text(description)
        }
        .padding()
    }
}

#Preview {
    DescriptionView(description: "Hola como estasdfasfas")
}
