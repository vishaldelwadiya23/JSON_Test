//
//  NewsFeed.swift
//  JSON_Test
//
//  Created by tmtech1 on 15/02/22.
//

import Foundation
import UIKit

struct NewsFeed: Codable {
    
    var status:String?
    var totalResults:Int?
    var articles:[Article]?
    
    var test:String?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        status = try value.decodeIfPresent(String.self, forKey: .status) ?? "No data"
        totalResults = try value.decodeIfPresent(Int.self, forKey: .totalResults)
        articles = try value.decodeIfPresent([Article].self, forKey: .articles)
    }
}

struct Article: Codable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    
    var source: Source?
    
    enum CodingKeys: String, CodingKey {

        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
}

struct Source: Codable {
    
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
