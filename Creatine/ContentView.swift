//
//  ContentView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostsViewModel()
    var body: some View {
        PostListView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
