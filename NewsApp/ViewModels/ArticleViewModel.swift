//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Rana on 05/03/23.
//

import Foundation

/// ArticleListViewModel

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    
    var heightForRow: CGFloat {
        return 30.0
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> AcrticleViewModel {
        let article = self.articles[index]
        return AcrticleViewModel(article)
    }
}

/// AcrticleViewModel

struct AcrticleViewModel {
    private let article: Article
}

extension AcrticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension AcrticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
