//
//  AddBookViewController.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/3/20.
//

import UIKit

protocol AddBookDelegate: class {
    func didCreate(_ book: Book)
}

class AddBookViewController: UIViewController {
    
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var authorInput: UITextField!
    @IBOutlet weak var imageURLInput: UITextField!
    @IBOutlet weak var dateStartInput: UIDatePicker!
    
    weak var delegate: AddBookDelegate?


    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let newBook = createNewBook()
        dump(newBook)
        if let unwrapped = newBook {
            self.delegate?.didCreate(unwrapped)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func createNewBook() -> Book?{
        if titleInput.hasText && authorInput.hasText {
            return Book(title: titleInput.text!, author: authorInput.text!, imageURL: imageURLInput.text!, notes:[])
        }
        return nil
    }
}
