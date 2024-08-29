//
//  ContentView.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 25.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registerViewModel = RegisterViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registerViewModel) // login sayfasından ulaşılan alt sayfalarda kullanmak için2
            } else if let currentUser = viewModel.currentUser{
                MainTabView(user: currentUser)
            }
        }
       
        
    }
}

#Preview {
    ContentView()
}
