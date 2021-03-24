//
//  ViewController.swift
//  NewsApp
//
//  Created by Goksubay on 24.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var url = ""

    @IBOutlet weak var tableView: UITableView!
    private var newsTableViewModel: NewsTableVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        NetworkManager.shared.getNews { (news) in
            if let news = news{
                self.newsTableViewModel = NewsTableVM(newsList: news)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : self.newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let newsViewModel = self.newsTableViewModel.atIndexPath(indexPath.row)
        cell.authorLabel.text = newsViewModel.author
        cell.titleLabel.text = newsViewModel.title
        NetworkManager.shared.getImage(urlString: newsViewModel.url2image, completion: { (image) in
            if let image = image{
                DispatchQueue.main.async {
                    cell.newsImageView.image = UIImage(data: image)
                }
            }
        })
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
            if segue.identifier == "webviewSegue" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let newsViewModel = self.newsTableViewModel.atIndexPath(indexPath.row)
                    let destination = segue.destination as? WebViewController
                    destination?.webSite = newsViewModel.url
                }
            }
        }
    
}

