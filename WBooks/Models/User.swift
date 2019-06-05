//
//  Comment.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 04/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

public struct User: Codable {
    let username: String
    let id: Int
    let image: String
    
    enum BookKey: String, CodingKey {
        case username
        case id
        case image
    }
    
    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: BookKey.self)
        username = try container.decode(String.self, forKey: .username)
        id = try container.decode(Int.self, forKey: .id)
        image = try container.decode(String.self, forKey: .image)
    }
}
