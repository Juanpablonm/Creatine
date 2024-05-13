//
//  PostListView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct PostListView: View {
    @State private var showFavoritesOnly = false
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                NavigationLink {
                    InfoView()
                } label: {
                    PostRowView()
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
    PostListView()
}
