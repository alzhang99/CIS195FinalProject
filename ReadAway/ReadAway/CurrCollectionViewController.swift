//
//  CurrCollectionView.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

class CurrCollectionViewController: UICollectionViewController, AddBookDelegate {
    
    var books : [Book] = [Book(title: "Where the Crawdads Sing", author: "Delia Owens", imageURL: "http://covers.openlibrary.org/b/isbn/9780385533225-L.jpg", notes: ["Quote on pg 22", "Love the cover"]), Book(title: "Excellent Sheep", author: "William Deresiewicz", imageURL: "http://covers.openlibrary.org/b/isbn/1476702721-L.jpg", notes: [])]
        
    let titles : [String] = ["book1", "book2", "book3"]
    var selectedBook : Book? = nil

    func didCreate(_ book: Book) {
        dismiss(animated: true, completion: nil)
        books.append(book)
        collectionView.reloadData()
    }
    
    @IBAction func segueAddBook(_ sender: Any) {
        performSegue(withIdentifier: "segue_addBook", sender: nil)
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
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var currCell = UICollectionViewCell()
        
        if let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            bookCell.configure(title: books[indexPath.row].title, author: books[indexPath.row].author, imageURL: books[indexPath.row].imageURL)
            currCell = bookCell
        }
        return currCell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: false)
        self.selectedBook = books[indexPath.row]
        dump(self.selectedBook)
        performSegue(withIdentifier: "segue_bookDetail", sender: nil)
    }
    
    //prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_addBook" {
            let addBookNavController = segue.destination as! UINavigationController
            let addBook = addBookNavController.topViewController as! AddBookViewController
            addBook.delegate = self
        } else if (segue.identifier == "segue_bookDetail") {
            let detailBook = segue.destination as! DetailBookViewController
            detailBook.selectedBook = self.selectedBook
        }
   }
    
}
