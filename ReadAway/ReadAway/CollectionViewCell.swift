//
//  CollectionViewCell.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var book: Book? = nil
    
//    func configure(with title: String) {
//        titleLabel.text = title
//    }
    
    func configure(title: String, author: String, imageURL:String) {
//        if let curr = book as Book? {
            titleLabel.text = title
            authorLabel.text = author
        
            if imageURL != "" {
                let url = URL(string: imageURL)
                imageView.kf.setImage(with: url)
            }
        
//            imageView.image = image
//        }
    }
}
