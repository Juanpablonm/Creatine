//
//  InfoView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//
import SwiftUI

struct InfoView: View {
    @StateObject var postViewModel: PostsViewModel
    @StateObject var userViewModel: UserViewModel
    @StateObject var commentViewModel: CommentViewModel
    var post: Post
    
    var postIndex: Int? {
        if let index = postViewModel.posts.firstIndex(where: { $0.id == post.id }) {
            return index
        } else {
            return nil
        }
    }
    
    var body: some View {
        if userViewModel.state.isLoading {
            LoaderView()
        } else{
            ZStack {
                ScrollView {
                    VStack (alignment: .leading) {
                        UserView(user: userViewModel.user)
                        DescriptionView(description: post.body)
                        Divider()
                        CommentView(comments: commentViewModel.comments)
                    }
                }
                .navigationTitle("Details")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        if (postIndex != nil) {
                            FavoriteButton(isSet: $postViewModel.posts[postIndex!].isFavorite.unwrap(defaultValue: false))
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        DeleteButtonView(postViewModel: postViewModel, titleDelete: "this post",postIndex: postIndex)
                            .padding()
                            .offset(y: +40)
                    }
                }
            }
        }
    }
}

#Preview {
    InfoView(
        postViewModel: PostsViewModel(),
        userViewModel: UserViewModel(userId: 1),
        commentViewModel: CommentViewModel(postId: 1),
        post: Post(userId: 1, id: 1, title: "Title", body: "Body", isFavorite: false)
    )
}

