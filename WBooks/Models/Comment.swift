//
//  Comment.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 04/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation

public struct Comment: Codable {
    let user: User
    let id: Int
    let book: Book
    let content: String
    
    enum BookKey: String, CodingKey {
        case user
        case id
        case book
        case content
    }
    
    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: BookKey.self)
        user = try container.decode(User.self, forKey: .user)
        id = try container.decode(Int.self, forKey: .id)
        book = try container.decode(Book.self, forKey: .book)
        content = try container.decode(String.self, forKey: .content)
    }
}
