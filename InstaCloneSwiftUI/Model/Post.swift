//
//  Post.swift
//  InstaCloneSwiftUI
//
//  Created by Harun AYDIN on 2.08.2024.
//

import Foundation
struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}

extension Post{
    static var MOCK_POST: [Post] = [
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", likes: 123, imageUrl: "kedi1", timeStamp: Date(), user: User.MOCK_USER[0]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", likes: 567, imageUrl: "kedi2", timeStamp: Date(), user: User.MOCK_USER[1]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", likes: 987, imageUrl: "kedi3", timeStamp: Date(), user: User.MOCK_USER[2]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", likes: 100, imageUrl: "kedi4", timeStamp: Date(), user: User.MOCK_USER[3]),
        .init(id: UUID().uuidString, ownerUid: UUID().uuidString, caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", likes: 321, imageUrl: "kedi5", timeStamp: Date(), user: User.MOCK_USER[4])
    ]
}
