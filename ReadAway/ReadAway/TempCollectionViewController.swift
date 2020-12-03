//
//  TempCollectionViewController.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

class TempCollectionViewController: UICollectionViewController {
    var books : [Book] = [Book(title: "Ally", author: "Zhang", image: nil), Book(title: "Amy", author: "Gutmann", image: nil)]
        
    let titles : [String] = ["book1", "book2", "book3"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var currCell = UICollectionViewCell()

        if let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            bookCell.configure(with: books[indexPath.row].title, author: books[indexPath.row].author, image: UIImage())
//            bookCell.configure(with: titles[indexPath.row])
            currCell = bookCell
        }
        return currCell
    }
    
}
