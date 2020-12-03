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
    
//    let url = URL(string: "http://covers.openlibrary.org/b/isbn/9780385533225-S.jpg")!
//    let imageData = try! Data(contentsOf:  URL(string: "http://covers.openlibrary.org/b/isbn/9780385533225-S.jpg")!)


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if (kind == UICollectionView.elementKindSectionHeader) {
            guard let cell  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TempHeaderCollectionReusableView", for: indexPath) as? TempHeaderCollectionReusableView else {
                fatalError()

            }
            cell.header.text = "Header"
            return cell

//        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var currCell = UICollectionViewCell()

        if let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            bookCell.configure(title: books[indexPath.row].title, author: books[indexPath.row].author, image: UIImage())
//            bookCell.configure(with: titles[indexPath.row])
            currCell = bookCell
        }
        return currCell
    }
    
}
