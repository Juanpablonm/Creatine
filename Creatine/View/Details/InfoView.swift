//
//  InfoView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//
import SwiftUI

struct InfoView: View {
    @ObservedObject var postViewModel: PostsViewModel
    @StateObject var userViewModel: UserViewModel
    @StateObject var commentViewModel: CommentViewModel
    var post: Post
    
    var postIndex: Int?
    func getPostIndex() -> Int {
        let index = postViewModel.posts.firstIndex(where: { $0.id == post.id })
        if (index != nil) {
            return index ?? 0
        } else {
            return 0
        }
    }

    init(post: Post, postViewModel: PostsViewModel) {
        self.post = post
        self.postViewModel = postViewModel
        _userViewModel = StateObject(wrappedValue: UserViewModel(userId: post.userId))
        _commentViewModel = StateObject(wrappedValue: CommentViewModel(postId: post.id))
        self.postIndex = getPostIndex()
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    BackPageView()
                    Spacer()
                    Text("Details")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    if (postIndex != nil) {
                        FavoriteButton(isSet: $postViewModel.posts[postIndex!].isFavorite.unwrap(defaultValue: false))
                    }
                }
                .padding(.horizontal)
                ScrollView {
                    VStack (alignment: .leading) {
                        UserView(user: userViewModel.user)
                        DescriptionView(description: post.body)
                        Divider()
                        CommentView(comments: commentViewModel.comments)
                    }
                }
            }

            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Spacer()
                    DeleteButtonView(postViewModel: postViewModel, titleDelete: "this post", postIndex: postIndex)
                        .padding()
                        .offset(y: +40)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    InfoView(
        post: Post(userId: 1, id: 1, title: "Title", body: "Body", isFavorite: false), postViewModel: PostsViewModel()
    )
}

