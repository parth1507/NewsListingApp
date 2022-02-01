//
//  Webservice.swift
//  GoodNews
//
//  Created by Matthew Ogtong on 1/17/22.
//

import Foundation

class Webservice {
    
    // func getArticles(url: URL, completion: ([Article]?) -> ())
    // * Do we need completion paremeter or should we seperate it
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> Void) {
        
        let session = URLSession.init(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let data = data {
                    if let articleList = self.parseJSON(data: data) {
                        completion(articleList.articles)
                    }
                }
            }
            
        }
        
        task.resume()
        
    }
    
    func parseJSON(data: Data) -> ArticleList? {
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodedData = try decoder.decode(ArticleList.self, from: data)
            
            return decodedData
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
}
