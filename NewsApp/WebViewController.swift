//
//  WebViewController.swift
//  NewsApp
//
//  Created by Goksubay on 25.03.2021.
//
import Foundation
import UIKit
import WebKit

class WebViewController : UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    var webSite : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let address = self.webSite,
            let webURL = URL(string: address) {
            let urlRequest = URLRequest(url: webURL)
            webView.load(urlRequest)
        }
    }
}
