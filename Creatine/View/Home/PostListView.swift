//
//  PostListView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct PostListView: View {
    @StateObject var viewModel: PostsViewModel
    
    @State private var showFavoritesOnly = false
    
    init(viewModel: PostsViewModel, showFavoritesOnly: Bool = false) {
        self._viewModel = StateObject(wrappedValue: PostsViewModel())
        self.showFavoritesOnly = showFavoritesOnly
    }
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(viewModel.posts) { post in
                    NavigationLink {
                        InfoView()
                    } label: {
                        PostRowView(post: post)
                    }
                }
            }
            .animation(.default, value: "")
            .navigationTitle("Posts")
        } detail: {
            Text("Select a Post")
        }
    }
}

#Preview {
    PostListView(viewModel: PostsViewModel())
}
