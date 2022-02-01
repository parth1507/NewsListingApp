//
//  Article.swift
//  GoodNews
//
//  Created by Matthew Ogtong on 1/18/22.
//

import Foundation

struct ArticleList: Decodable {
    
    let articles: [Article]
    
}

struct Article: Decodable {
    let author:String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
