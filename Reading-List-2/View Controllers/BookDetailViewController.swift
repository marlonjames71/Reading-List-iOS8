//
//  ViewController.swift
//  Reading-List-2
//
//  Created by Marlon Raskin on 7/23/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

	var book: Book?

	var bookController: BookController?

	

	@IBOutlet weak var viewForTextField: UIView!
	@IBOutlet weak var viewForTextView: UIView!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var textView: UITextView!


	override func viewDidLoad() {
		super.viewDidLoad()
		updateViews()

		viewForTextView.layer.borderWidth = 1
		viewForTextView.layer.cornerRadius = 8
		viewForTextView.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
	}

	@IBAction func saveTapped(_ sender: UIBarButtonItem) {
		guard let title = textField.text,
				!title.isEmpty,
			let reason = textView.text,
				!reason.isEmpty else { return }
		if let book = book {
			bookController?.updateBookInfo(for: book, title: title, reason: reason)
		} else {
			bookController?.createBook(title: title, reasonToRead: reason)
		}
		navigationController?.popToRootViewController(animated: true)
	}

	func updateViews() {
		guard let book = book else {
			title = "Add a new book"
			return
		}
		title = book.title
		textField.text = book.title
		textView.text = book.reasonToRead
	}
}

