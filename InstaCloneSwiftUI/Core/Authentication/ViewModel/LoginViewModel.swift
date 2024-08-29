//
//  LoginViewModel.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 4.08.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
