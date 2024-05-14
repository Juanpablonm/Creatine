//
//  InfoView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct InfoView: View {
//    var post: Post
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                UserView()
                DescriptionView()
                Divider()
                CommentView()
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    InfoView()
}
