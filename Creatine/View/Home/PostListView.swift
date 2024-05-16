import SwiftUI

struct PostListView: View {
    @StateObject var postViewModel: PostsViewModel
    @State private var showFavoritesOnly = false
    
    init(viewModel: PostsViewModel = PostsViewModel(), showFavoritesOnly: Bool = false) {
        self._postViewModel = StateObject(wrappedValue: viewModel)
        self.showFavoritesOnly = showFavoritesOnly
    }
    
    var filteredPosts: [Post] {
        postViewModel.posts.filter { post in
            (!showFavoritesOnly || (post.isFavorite ?? false))
        }
    }
    
    var body: some View {
        if postViewModel.state.isLoading {
            LoaderView()
        } else {
            
            NavigationSplitView {
                ZStack {
                    List {
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }
                        ForEach(filteredPosts) { post in
                            NavigationLink(destination: InfoView(
                                postViewModel: postViewModel,
                                userViewModel: UserViewModel(userId: post.userId),
                                commentViewModel: CommentViewModel(postId: post.id),
                                post: post)) {
                                    PostRowView(post: post)
                                }
                        }
                    }
                    .animation(.bouncy, value: showFavoritesOnly)
                    .navigationTitle("Posts")
                    VStack {
                        Spacer()
                        HStack {
                        Spacer()
                            DeleteButtonView(postViewModel: postViewModel, titleDelete: "all posts")
                                .padding()
                                .offset(y: +40)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        RefreshButtonView(postViewModel: postViewModel)
                    }
                }

            } detail: {
                Text("Select a Post")
            }
        }
    }
}

#Preview {
    PostListView(viewModel: PostsViewModel())
}
