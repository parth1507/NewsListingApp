//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Matthew Ogtong on 1/19/22.
//

import Foundation

//MARK: - ArticleListViewModel

struct ArticleListViewModel {
    
    let articles: [Article]
    
}

extension ArticleListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
    func selectArticleIndex(_ index: Int) -> Article {
        let selectedArticle = self.articles[index]
        return selectedArticle
    }
}

//MARK: - ArticleViewModel

struct ArticleViewModel {
    
    private let article: Article
    
}

extension ArticleViewModel {
    
    init(_ article: Article) {
        self.article = article
    }
    
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title ?? ""
    }
    
    var description: String {
        return self.article.description ?? ""
    }
    
    var author:String {
        return self.article.author ?? ""
    }

    var url: String {
        return self.article.url ?? ""
    }

    var urlToImage: String {
        return self.article.urlToImage ?? ""
    }

    var publishedAt: String {
        return self.article.publishedAt ?? ""
    }

    var content: String {
        return self.article.content ?? ""
    }
}
