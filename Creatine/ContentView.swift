//
//  ContentView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostsViewModel()
    @State private var isActive = false
        var body: some View {
            if isActive {
                PostListView(viewModel: viewModel)
            }else {
                SplashView(isActive: $isActive)
            }
        }
}

#Preview {
    ContentView()
}
