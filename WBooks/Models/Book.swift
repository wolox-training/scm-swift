//
//  Book.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 28/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation

public struct Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String

    enum BookKey: String, CodingKey {
        case id
        case title
        case author
        case genre
        case year
        case image
    }
    
    public init(from: Decoder) throws {
                let container = try from.container(keyedBy: BookKey.self)
                id = try container.decode(Int.self, forKey: .id)
                title = try container.decode(String.self, forKey: .title)
                author = try container.decode(String.self, forKey: .author)
                genre = try container.decode(String.self, forKey: .genre)
                year = try container.decode(String.self, forKey: .year)
                image = try container.decode(String.self, forKey: .image)
    }
}
