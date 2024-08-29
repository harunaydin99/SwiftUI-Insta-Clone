//
//  CompleteSignUpView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 31.07.2024.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    @Environment(\.dismiss) var dismiss // bu sayfanın kapatıcısı. yok edicisi
    @EnvironmentObject var viewModel: RegisterViewModel
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Text("Welcome to Insta, \(viewModel.username)")
               // Text(viewModel.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color("buttonTextColor"))
                    .multilineTextAlignment(.center)
                Text("Click below to complete registration and start using Insta")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                Button{
                    // Main e yönlendir
                    Task{ try await viewModel.createUser() }
                    print("COMPLETE")
                } label: {
                    Text("Complete sign up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color("buttonTextColor"))
                        .padding()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("buttonTextColor"), lineWidth: 1)
                )
                .padding(.horizontal,24)
                Spacer()
                    
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    CompleteSignUpView()
        .environmentObject(RegisterViewModel())
}
