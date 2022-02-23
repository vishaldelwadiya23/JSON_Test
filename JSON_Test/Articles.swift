//
//  Articles.swift
//  JSON_Test
//
//  Created by tmtech1 on 15/02/22.
//

import Foundation

struct Article: Codable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    var content:String?
    
    var source: Source
    
    struct Source: Codable {
        
        var id: String?
        var name: String?
    }
}
