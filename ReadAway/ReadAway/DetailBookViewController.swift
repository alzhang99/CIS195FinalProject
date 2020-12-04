//
//  DetailBookViewController.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var noteInput: UILabel!
    @IBOutlet weak var textInput: UITextView!
}

class DetailBookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddNoteDelegate {

    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var imageURLLabel: UILabel!
    @IBOutlet weak var dateInput: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
 
    
    var selectedBook: Book? = nil
        
    func didCreate(_ note: String) {
        dismiss(animated: false, completion: nil)
        selectedBook?.notes.append(note)
        tableView.reloadData()
    }
    
    @IBAction func segueAddNote(_ sender: Any) {
        performSegue(withIdentifier: "segue_addNote", sender: nil)

    }
    
    override func viewDidLoad() {
        if let curr = selectedBook as Book? {
            if curr.imageURL != "" {
                let url = URL(string: curr.imageURL)
                imageView.kf.setImage(with: url)
            }
            bookLabel.text = curr.title
            authorLabel.text = curr.author
            imageURLLabel.text = curr.imageURL
//                dateInput.text = curr.dateInput
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let curr = selectedBook as Book? {
            if curr.notes != [] {
                return selectedBook!.notes.count
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
//        cell.textLabel?.text = temp[indexPath.row]
        cell.textInput?.text = selectedBook?.notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    //prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_addNote" {
            let navController = segue.destination as! UINavigationController
            let addNote = navController.topViewController as! AddNoteViewController
            addNote.delegate = self
       }
   }
}
