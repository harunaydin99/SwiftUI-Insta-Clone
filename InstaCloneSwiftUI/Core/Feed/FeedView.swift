//
//  FeedView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 27.07.2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(Post.MOCK_POST){ post in
                        FeedCell(post: post)
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Image("instalogo1")
                        .resizable()
                        .frame(width: 100, height: 42)
                }
                ToolbarItem(placement: .topBarTrailing){
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
