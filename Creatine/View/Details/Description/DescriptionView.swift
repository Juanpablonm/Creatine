//
//  DescriptionView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.title2.weight(.medium))
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac.")
        }
        .padding()
    }
}

#Preview {
    DescriptionView()
}
