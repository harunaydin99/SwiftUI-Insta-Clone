//
//  ProfileHeaderView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 2.08.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing:10){
            // Profil kartı
            HStack{
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80,height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing:20){
                    UserStatView(value: 10, title: "Posts")
                    UserStatView(value: 10, title: "Followers")
                    UserStatView(value: 10, title: "Following")
                }
            }
            .padding(.horizontal)
            
            // isim ve açıklama
            VStack(alignment: .leading,spacing: 4){
                Text(user.fullname ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(user.bio ?? "")
                    .font(.footnote)
                
                Text(user.username)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            // edit profile butonu
            Button{
                
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else{
                    print("Takip edildi...")
                }
                
            } label: {
                Text(user.isCurrentUser ? "Edit profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(width: 360,height: 32)
                    .background(user.isCurrentUser ? .white : Color(.blue))
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .foregroundStyle(Color("buttonTextColor"))
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USER[0])
}
