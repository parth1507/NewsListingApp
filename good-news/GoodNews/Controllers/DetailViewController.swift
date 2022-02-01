//
//  DetailViewController.swift
//  GoodNews
//
//  Created by Abhishek Gambhir on 31/01/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var newsAuthor: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    var data: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func imageButtonAction(_ sender: UIButton) {
        let imageVC  =  (self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController)!
        imageVC.imageUrl = data?.urlToImage
        self.navigationController?.pushViewController(imageVC, animated: true)
    }
    func setup() {
        newsTitle.text = data?.title
        newsDescription.text = data?.description
        newsAuthor.text = data?.author
        newsDate.text = getFormattedDate(currentFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZ", requiredFormat: "dd MMM, yyyy hh:mm a", date: data?.publishedAt ?? "")
        image.image = getImage(url: data?.urlToImage)
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
    
    func getImage(url: String?)-> UIImage{
        if let imageStringURL = url{
            if let imageURL = URL(string: imageStringURL) {
                if let data = try? Data(contentsOf: imageURL) {
                    return  UIImage(data: data) ?? UIImage()
                }
            }
        }
    return UIImage()
    }
    
}
