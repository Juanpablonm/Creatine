//
//  DeleteButtonView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 16/5/24.
//

import SwiftUI

struct DeleteButtonView: View {
    @StateObject var postViewModel: PostsViewModel
    @State private var showingConfirmationAlert = false
    @State private var didError = false
    var titleDelete: String
    var postIndex: Int?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        Button(action: {
            showingConfirmationAlert = true
        }) {
            Circle()
                .stroke(Color.white, lineWidth: 3)
                .frame(width: 45, height: 45)
                .background(Circle().fill(Color.white))
                .overlay {
                    Label("Delete", systemImage: "trash.circle.fill")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(.gray)
                        .font(.system(size: 40))
                }
                .shadow(radius: 0.5)
        }
        .alert(
            Text("Do you want to delete \(titleDelete)?"),
            isPresented: $showingConfirmationAlert,
            presenting: postViewModel.posts
        ) {_ in
            Button(role: .destructive) {
                if let postIndex = postIndex {
                    presentationMode.wrappedValue.dismiss()
                    postViewModel.deletePost(at: postIndex)
                } else {
                    postViewModel.clearAllPosts()
                }
            } label: {
                Text("Delete")
            }
        }
    }
}

#Preview {
    DeleteButtonView(postViewModel: PostsViewModel(), titleDelete: "delete")
}
