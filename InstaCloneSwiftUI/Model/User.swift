//
//  User.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 2.08.2024.
//

import Foundation
import Firebase
import FirebaseAuth

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool{
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User{
    static var MOCK_USER: [User] = [
        .init(id: UUID().uuidString, username: "cat1", profileImageUrl: "kedi1", fullname: "Cat1", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "monkey1@gmail.com"),
        .init(id: UUID().uuidString, username: "cat2", profileImageUrl: "kedi2", fullname: "Cat2", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "monkey2@gmail.com"),
        .init(id: UUID().uuidString, username: "cat2", profileImageUrl: "kedi3", fullname: "Cat3", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "monkey3@gmail.com"),
        .init(id: UUID().uuidString, username: "cat4", profileImageUrl: "kedi4", fullname: "Cat4", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "monkey4@gmail.com"),
        .init(id: UUID().uuidString, username: "cat5", profileImageUrl: "kedi5", fullname: "Cat5", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", email: "monkey5@gmail.com")
    ]
}
