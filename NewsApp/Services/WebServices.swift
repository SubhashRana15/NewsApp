//
//  WebServices.swift
//  NewsApp
//
//  Created by Rana on 05/03/23.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion:@escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error =  error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articlesList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if articlesList != nil {
                    completion(articlesList?.articles)
                }
            }
        }.resume()
    }
}
