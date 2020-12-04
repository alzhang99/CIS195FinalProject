//
//  AddNoteViewController.swift
//  ReadAway
//
//  Created by Ally Zhang on 12/4/20.
//

import UIKit

protocol AddNoteDelegate: class {
    func didCreate(_ note: String)
}

class AddNoteViewController: UIViewController {
    @IBOutlet weak var newNote: UITextView!
    
    weak var delegate: AddNoteDelegate?
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let newNote = createNewNote()
        if let unwrapped = newNote {
            self.delegate?.didCreate(unwrapped)
        } else {
            dismiss(animated: false, completion: nil)
        }
    }
    
    func createNewNote() -> String?{
        if newNote.hasText {
            return newNote.text!
        }
        return nil
    }
    
}
