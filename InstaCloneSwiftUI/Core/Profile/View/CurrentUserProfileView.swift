//
//  CurrentUserProfileView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 2.08.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POST.filter({ $0.user?.username == user.username}) // hangi user aktifse onun postlarnı al.
    }
    
    var body: some View {
        NavigationStack{ // search view dan buraya gelirken sorun çıkarıyor
            ScrollView {
                VStack{
                    // header
                    ProfileHeaderView(user: user)
                    //POSTS
                    PostGridView(posts: posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(Color("buttonTextColor"))
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USER[0])
}
