//
//  ProfileView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 25.07.2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User

    var posts: [Post] {
        return Post.MOCK_POST.filter({ $0.user?.username == user.username}) // hangi user aktifse onun postlarnı al.
    }

    var body: some View {
     //   NavigationStack{ // search view dan buraya gelirken sorun çıkarıyor
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
            
      //  }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER[0])
}
