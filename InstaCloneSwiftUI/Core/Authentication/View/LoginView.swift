//
//  LoginView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 29.07.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Image("instalogo1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
                VStack(spacing:12){
                    TextField("Email Adresiniz", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    SecureFieldWithButton(text: $viewModel.password, "Enter Your Password")
                }

                    Button{
                        Task{ try await viewModel.signIn() }
                    } label: {
                        Text("Login")
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
                    .padding(.top, 12)
                    
                    Button(action: {}, label: {
                        Text("Forget Password?")
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .padding(.top)
                            .padding(.trailing, 24)
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                    HStack{
                        Rectangle()
                            .frame(height: 0.5)
                        Text("OR")
                        Rectangle()
                            .frame(height: 0.5)
                    }
                    .padding(.horizontal, 24)
                    .foregroundStyle(.gray)
                    
                    HStack{
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Continue with Facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.top, 8)
                
                Spacer()
                Divider()
                
                NavigationLink{
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label:{
                    HStack{
                        Text("Don't have an account ?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical, 16)
                
            }
        }
       
        
        
    }
}

#Preview {
    LoginView()
}
