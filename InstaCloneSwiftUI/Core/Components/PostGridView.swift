//
//  PostGridView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 2.08.2024.
//

import SwiftUI

struct PostGridView: View {
    
    var posts: [Post]
    private let gridItems: [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1)
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    var body: some View {
        // POST
        LazyVGrid(columns: gridItems,spacing: 1){
            ForEach(posts){ post in
                Image(post.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped() // şu anki fotoğraf 16:9 ama tam tersi yani dik foto olsaydı kötü olacaktı. o yüzden clipped yaptık
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POST)
}
