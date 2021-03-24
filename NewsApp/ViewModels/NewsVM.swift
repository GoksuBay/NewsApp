//
//  NewsVM.swift
//  News Project
//
//  Created by Goksubay on 24.03.2021.
//

import Foundation

struct NewsVM {
    let news: NewsModel
    var author: String{
        return self.news.author ?? "Unknown"
    }
    
    var title: String {
        return self.news.title ?? "Unknown"
    }
    
    var desc: String {
        return self.news.description ?? "Unknown"
    }
    
    var url: String {
        return self.news.url ?? "Unknown"
    }
    
    var url2image: String {
        return self.news.urlToImage ?? "Unknown"
    }
}
    
