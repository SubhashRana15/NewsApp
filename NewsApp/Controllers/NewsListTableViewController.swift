//
//  NewsListTableViewController.swift
//  NewsApp
//
//  Created by Rana on 05/03/23.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarSetup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=47b36834f5004248a4cb6ebe2be73f1f")!
        
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print("Rana: \(self.articleListVM.articles[0].title)")
                }
            }
        }
}
    
        override func numberOfSections(in tableView: UITableView) -> Int {
            return self.articleListVM ==  nil ? 0 : self.articleListVM.numberOfSections
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.articleListVM.numberOfRowsInSection(section)
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexpath) as? ArticleTableViewCell else {
                fatalError("Cell not found")
            }

            let articleVM = self.articleListVM.articleAtIndex(indexpath.row)

            cell.titleLabel.text = articleVM.title
            cell.descriptionLabel.text = articleVM.description
            print("Rana: \(articleVM.title)")
            return cell
        }
    
    private func navigationBarSetup() {
        navigationController?.navigationBar.prefersLargeTitles = true

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemTeal
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
}


