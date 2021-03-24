//
//  NewsModel.swift
//  News Project
//
//  Created by Goksubay on 23.03.2021.
//

import Foundation

struct NewsModel : Decodable{
    /* They are all optional because we can get nil from JSON */
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct News : Decodable{
    let articles: [NewsModel]
    let status: String
    let totalResults: Int
}
