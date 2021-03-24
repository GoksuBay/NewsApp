//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Goksubay on 24.03.2021.
//

import Foundation

class NetworkManager{
    
    /* Using Singleton Pattern, inizialite the class */
    private init() {}
    static let shared = NetworkManager()
    
    let imageCache = NSCache<NSString, NSData>() // Creating NSCache dictionary to get the image for each news
    private let url = "https://newsapi.org/v2/top-headlines?country=tr&apiKey=d4b26469d3af47b19e0bc5228465fc0e"
    
    func getNews(completion: @escaping ([NewsModel]?) -> Void){
        guard let url = URL(string: self.url) else{
            print("url error")
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error)
                return
            }
                if let data = data{
                    do {
                        let news = try JSONDecoder().decode(News.self, from: data)
                    } catch let error {
                        print(error)
                    }
                    
                    let news = try? JSONDecoder().decode(News.self, from: data)
                    news == nil ? completion(nil) : completion(news!.articles)
            }
                
        }.resume()
    }
    
    func getImage(urlString: String , completion: @escaping (Data?) -> Void ){
        guard let url = URL(string: urlString) else{
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)){
            completion(cachedImage as Data)
        } else{
            URLSession.shared.dataTask(with: url) {(data, response, err) in
                guard err == nil, let data = data else {completion(nil) ; return}
            
            
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
