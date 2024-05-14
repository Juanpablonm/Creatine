import SwiftUI

struct PostRowView: View {
    var post: Post
    
    var body: some View {
        HStack {
            Text(post.title ?? "No Title")
            Spacer()
        }
    }
}

#Preview {
    let post = Post(userId: 1,
                    id: 1,
                    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                    body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
    return PostRowView(post: post)
}
