//
//  DetailBookViewController.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

class DetailBookViewController: UIViewController {
    
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var imageURLInput: UILabel!
    @IBOutlet weak var dateInput: UILabel!
    
    var selectedBook: Book? = nil
    
    override func viewDidLoad() {
        if let curr = selectedBook as Book? {
            if curr.imageURL != "" {
                let url = URL(string: curr.imageURL)
                imageView.kf.setImage(with: url)
            }
            bookLabel.text = curr.title
            titleLabel.text = curr.title
            authorLabel.text = curr.author
            imageURLInput.text = curr.imageURL
//                dateInput.text = curr.dateInput
        }
        }
}
