//
//  CommentsView.swift
//  Creatine
//
//  Created by Juan Pablo Nunez on 13/5/24.
//

import SwiftUI

struct CommentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(alignment: .leading) {
            DisclosureGroup {
                VStack {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl. Proin dictum ligula vel interdum hendrerit. Curabitur maximus sollicitudin vehicula. Maecenas vestibulum vehicula viverra. Mauris vel dolor lorem. Nullam felis nulla, cursus sit amet nunc nec, venenatis mollis risus. Integer ut semper purus, a ullamcorper sem. Proin mattis facilisis est at molestie. Morbi lobortis hendrerit sapien sed fringilla. In volutpat nec libero ut consequat. Fusce placerat lectus odio, ac facilisis dolor egestas ac. Vestibulum porta elit et porttitor tincidunt. Ut imperdiet consectetur nunc sit amet scelerisque. ")
                        .padding(10)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(12)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl. Proin dictum ligula vel interdum hendrerit. Curabitur maximus sollicitudin vehicula. Maecenas vestibulum vehicula viverra. Mauris vel dolor lorem. Nullam felis nulla, cursus sit amet nunc nec, venenatis mollis risus. Integer ut semper purus, a ullamcorper sem. Proin mattis facilisis est at molestie. Morbi lobortis hendrerit sapien sed fringilla. In volutpat nec libero ut consequat. Fusce placerat lectus odio, ac facilisis dolor egestas ac. Vestibulum porta elit et porttitor tincidunt. Ut imperdiet consectetur nunc sit amet scelerisque. ")
                        .padding(10)
                        .background(Color.gray.opacity(0.05))
                        .cornerRadius(12)
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
    CommentView()
}
