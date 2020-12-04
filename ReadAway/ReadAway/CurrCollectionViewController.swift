//
//  CurrCollectionView.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

class CurrCollectionViewController: UICollectionViewController, AddBookDelegate {
    
    var books : [Book] = [Book(title: "Ally", author: "Zhang", imageURL: "http://covers.openlibrary.org/b/isbn/9780385533225-L.jpg"), Book(title: "Amy", author: "Gutmann", imageURL: "http://covers.openlibrary.org/b/isbn/9780394800011-L.jpg")]
        
    let titles : [String] = ["book1", "book2", "book3"]
    
    func didCreate(_ book: Book) {
        dismiss(animated: true, completion: nil)
        books.append(book)
        collectionView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            guard let cell  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusable", for: indexPath) as? HeaderCollectionReusable else {
                fatalError()
            }
            cell.header.text = "Current Books"
            return cell

//        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var currCell = UICollectionViewCell()
        
        if let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            bookCell.configure(title: books[indexPath.row].title, author: books[indexPath.row].author, imageURL: books[indexPath.row].imageURL)
            currCell = bookCell
        }
        return currCell
    }
    
    //prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_addBook" {
            let addBookNavController = segue.destination as! UINavigationController
            let addBook = addBookNavController.topViewController as! AddBookViewController
            addBook.delegate = self
       }
   }
    
}
