//
//  AuthService.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 4.08.2024.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        
        Task{
            try await loadUserData()
        }
    }
    
    @MainActor // user session dolmayacak
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData() // login olunca currentuser ı doldur
        } catch  {
            print("failed to log in with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("Hata - \(error.localizedDescription)")
        }
    }
    
    func uploadUserData(uid: String, username:String, email:String) async{
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
    @MainActor
    func loadUserData() async throws{ // kullanıcının firebase deki verilerini telefona yükler
        self.userSession = Auth.auth().currentUser
        guard let currentUid = self.userSession?.uid else { return }
        
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        
        self.currentUser = try? snapshot.data(as: User.self) // firestore daki veriyi aldık ama bunu user nesnesine çevirmemiz gerekiyor.
        
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    
}
