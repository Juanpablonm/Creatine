//
//  CommentsView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct CommentView: View {
    var comments: [Comment]
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .leading) {
            DisclosureGroup {
                VStack {
                    ForEach(comments) { comment in
                        VStack(alignment: .leading){
                            HStack {
                                PhotoView(size: 30, border: 1)
                                Text(comment.name)
                                    .font(.footnote)
                                    .bold()
                            }
                            Text(comment.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                            .padding(10)
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(12)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        label: {
            Label("Comments", systemImage: "info.bubble.fill")
                .font(.title2.weight(.medium))
                .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
        }.accentColor(colorScheme == .dark ? Color.white : Color.black)
                .padding()
        }
    }
}
#Preview {
    CommentView(comments: [Comment(id: 1, postId: 1, name: "Juan Pablo", email: "", body: "asdasdadsasda")])
}
