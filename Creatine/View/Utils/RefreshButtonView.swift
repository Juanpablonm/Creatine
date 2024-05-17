//
//  RefreshButtonView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 16/5/24.
//

import SwiftUI

struct RefreshButtonView: View {
    @ObservedObject var postViewModel: PostsViewModel
    
    var body: some View {
        Button(action: {
            postViewModel.loadPosts()
        }) {
            Label("Download", systemImage: "icloud.and.arrow.down.fill")
                .labelStyle(.iconOnly)
                .font(.system(size: 30))
        }
    }
}

#Preview {
    RefreshButtonView(postViewModel: PostsViewModel())
}
