//
//  CollectionViewCell.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var book: Book? = nil
    
//    func configure(with title: String) {
//        titleLabel.text = title
//    }
    
    func configure(with title: String, author: String, image:UIImage) {
//        if let curr = book as Book? {
            titleLabel.text = title
            authorLabel.text = author
            imageView.image = image
//        }
    }
}
