//
//  ImageViewController.swift
//  GoodNews
//
//  Created by Abhishek Gambhir on 31/01/22.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        getImage(url: imageUrl)
    }
    
    func getImage(url: String?){
        if let imageStringURL = url{
            if let imageURL = URL(string: imageStringURL) {
                if let data = try? Data(contentsOf: imageURL) {
                    imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
