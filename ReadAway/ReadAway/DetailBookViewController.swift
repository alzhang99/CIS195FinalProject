//
//  DetailBookViewController.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var noteInput: UILabel!
    
}

class DetailBookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var imageURLLabel: UILabel!
    @IBOutlet weak var dateInput: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noteInput: UILabel!
    
    var selectedBook: Book? = nil
    
    var temp: [String] = ["note1", "note2", "note3"]
    
    override func viewDidLoad() {
        if let curr = selectedBook as Book? {
            if curr.imageURL != "" {
                let url = URL(string: curr.imageURL)
                imageView.kf.setImage(with: url)
            }
            bookLabel.text = curr.title
            titleLabel.text = curr.title
            authorLabel.text = curr.author
            imageURLLabel.text = curr.imageURL
//                dateInput.text = curr.dateInput
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = temp[indexPath.row]

        return cell
    }
}
