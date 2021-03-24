//
//  NewsTableVM.swift
//  NewsApp
//
//  Created by Goksubay on 24.03.2021.
//

import Foundation

struct NewsTableVM {
    let newsList : [NewsModel]
    
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    
    func atIndexPath(_ index: Int) -> NewsVM{
        let news = self.newsList[index]
        return NewsVM(news: news)
    }
}


