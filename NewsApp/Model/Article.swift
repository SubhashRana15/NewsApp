//
//  Article.swift
//  NewsApp
//
//  Created by Rana on 05/03/23.
//

import Foundation


struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
