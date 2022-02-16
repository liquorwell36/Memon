//
//  BookDetailViewController.swift
//  Memon
//
//  Created by kosuke sakai on 2022/02/14.
//

import Foundation
import UIKit

class BookDetailViewController: UIViewController {
    
    var parameters: BookInfo = BookInfo(title: "タイトル", authors: ["著者名"], publisher: "出版社", description: "説明文", imageLinks: Thumbnail(smallThumbnail: URL(string: "https://google.com"), thumbnail: URL(string: "https://google.com")))
    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.showImage(imageView: bookImageView)
    }
    
    private func setupUI() {
        bookTitleLabel.text = parameters.title
        authorLabel.text = parameters.authors.joined(separator: ", ")
    }
    
    private func showImage(imageView: UIImageView) {
        if let http_url = parameters.imageLinks?.smallThumbnail {
            let https_string_url = "https" + http_url.absoluteString.dropFirst(4)
            let https_url = URL(string: https_string_url)
            
            do {
                let data = try Data(contentsOf: https_url!)
                let image = UIImage(data: data)
                imageView.image = image
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func didTapToTweetButton() {
        
        self.performSegue(withIdentifier: "toTweetViewController", sender: nil)
    }
}
