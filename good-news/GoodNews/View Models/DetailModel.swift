//
//  DetailModel.swift
//  GoodNews
//
//  Created by superadmin on 01/02/22.
//

import Foundation

struct DetailViewModel {
    let article: Article
}


extension DetailViewModel{
    
    init(_ article: Article) {
        self.article = article
    }
    
}

extension DetailViewModel {
    var newsTitle: String {
        return self.article.title ?? ""
    }
    var newsDescription: String {
        return self.article.description ?? ""
    }
    var image: String {
        return self.article.urlToImage ?? ""
    }
    var newsAuthor: String {
        return self.article.author ?? ""
    }
    var newsDate: String {
        return self.article.publishedAt ?? ""
    }
}
