//
//  NewsTableViewCell.swift
//  GoodNews
//
//  Created by Abhshek Gambhir on 31/01/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var urlLink: UIButton!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    var newsVc: UIViewController?
    var datasource: ArticleViewModel? {
        didSet {
            title.text = datasource?.title
            author.text = datasource?.author
            let urlTitle = datasource?.url ?? ""
            urlLink.setTitle(String(urlTitle.prefix(25)), for: .normal)
            if let imageStringURL = datasource?.urlToImage {
                if let imageURL = URL(string: imageStringURL) {
                    if let data = try? Data(contentsOf: imageURL) {
                        newImage.image = UIImage(data: data)
                    }
                }
            }
            timeStamp.text = getFormattedDate(currentFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZ", requiredFormat: "dd MMM, yyyy hh:mm a", date: datasource?.publishedAt ?? "")
        }
    }
    
    @IBAction func linkButton(_ sender: UIButton) {
        let vc = WebViewController()
        vc.urlString = datasource?.url
        newsVc?.show(vc, sender: newsVc)
    }
    
    @IBAction func imageButtonAction(_ sender: Any) {
        let imageVC  =  (newsVc?.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController)!
        imageVC.imageUrl = datasource?.urlToImage
        newsVc?.navigationController?.pushViewController(imageVC, animated: true)
    }
    
    func getImage(url: String?)-> UIImage {
        if let imageStringURL = url{
            if let imageURL = URL(string: imageStringURL) {
                if let data = try? Data(contentsOf: imageURL) {
                    return  UIImage(data: data) ?? UIImage()
                }
            }
        }
    return UIImage()
    }
   func getFormattedDate(currentFormat: String, requiredFormat: String, date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = currentFormat
        if let date = formatter.date(from: date) {
            formatter.dateFormat = requiredFormat
            return formatter.string(from: date)
        }
         return ""
    }
}
