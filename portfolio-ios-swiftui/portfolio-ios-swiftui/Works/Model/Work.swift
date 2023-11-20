//
//  Work.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/15.
//

import Foundation

struct Image: Codable {
    let image: URL?
}

struct Tag: Codable {
    let tag: String
}

struct WorkDatail: Codable {
    let title: String
    let description: String
    let images: [Image]
    let tags: [Tag]
    let icon: URL
    let userName: String
    let work: URL
    let movie: URL
    let security: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case images
        case tags
        case icon = "user_icon"
        case userName = "user_name"
        case work = "work_url"
        case movie = "movie_url"
        case security
      }
}

struct ArticleID: Codable {
    let articleID: String
}
