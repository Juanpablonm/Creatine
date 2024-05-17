//
//  InfoView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//
import SwiftUI

struct InfoView: View {
    @ObservedObject var postViewModel: PostsViewModel
    @ObservedObject var userViewModel: UserViewModel
    @ObservedObject var commentViewModel: CommentViewModel
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
        let postId = post.id
        let userId = post.userId
        self.post = post
        self.postViewModel = postViewModel
        self.userViewModel = UserViewModel(userId: userId)
        self.commentViewModel = CommentViewModel(postId: postId)
        self.postIndex = getPostIndex()
    }
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading) {
                ZStack {
//                    RoundedRectangle(cornerRadius: 15)
//                                    .fill(Color.blue)
////                                    .shadow(color: Color.black.opacity(0.25), radius: 10, x: 0, y: 5)
//                                    .frame(maxHeight: .infinity)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
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
                }
                    .background(Color.gray)
                ScrollView {
                    VStack (alignment: .leading) {
                        UserView(user: userViewModel.user)
                        DescriptionView(description: post.body)
                        Divider()
                        CommentView(comments: commentViewModel.comments)
                    }
                }.background(Color.gray)
                .navigationBarBackButtonHidden(true)
            }
//                            .navigationTitle("Details")
//                            .navigationBarTitleDisplayMode(.inline)
//                            .toolbar {
//                                ToolbarItem(placement: .automatic) {
//                                    if (postIndex != nil) {
//                                        FavoriteButton(isSet: $postViewModel.posts[postIndex!].isFavorite.unwrap(defaultValue: false))
//                                    }
//                                }
//                            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    DeleteButtonView(postViewModel: postViewModel, titleDelete: "this post", postIndex: postIndex)
                        .padding()
                        .offset(y: +40)
                }
            }
        }
    }
}

#Preview {
    InfoView(
        post: Post(userId: 1, id: 1, title: "Title", body: "Body", isFavorite: false), postViewModel: PostsViewModel()
    )
}

