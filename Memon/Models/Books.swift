//
//  Books.swift
//  Memon
//
//  Created by kosuke sakai on 2022/02/10.
//

import Foundation

struct Books: Decodable {
    var totalItems: Int
    var items: [Book?]
}

struct Book: Decodable {
    var id: String
    var volumeInfo: BookInfo
}

struct BookInfo: Decodable {
    var title: String
    var authors: [String]
    var publisher: String
    var description: String
    var imageLinks: Thumbnail
}

struct Thumbnail: Decodable {
    var smallThumbnail: URL
    var thumbnail: URL
}
