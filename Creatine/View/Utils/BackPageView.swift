//
//  BackPageView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 17/5/24.
//

import SwiftUI

struct BackPageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Label("Back", systemImage: "chevron.left.circle.fill")
                .labelStyle(.iconOnly)
                .foregroundStyle(.gray)
                .font(.system(size: 25))
        }
    }
}

#Preview {
    BackPageView()
}
