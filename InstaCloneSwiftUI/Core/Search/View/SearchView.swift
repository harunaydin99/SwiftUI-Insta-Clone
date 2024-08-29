//
//  SearchView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 29.07.2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users){ user in
                        NavigationLink(value: user) {  // tıklanınca geçiş yapacağız. geçerken user değişkenini taşı
                            HStack{
                              //  Image(user.profileImageUrl ?? "")
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color("buttonTextColor"))
                                    Text(user.fullname ?? "")
                                        .foregroundStyle(Color("buttonTextColor"))
                                        .font(.footnote)
                                        
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .searchable(text: $searchText, prompt: "Search...")
                
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
            
        }
    }
}

#Preview {
    SearchView()
}
