//
//  ViewController.swift
//  Reading-List-2
//
//  Created by Marlon Raskin on 7/23/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

	@IBOutlet weak var viewForTextField: UIView!
	@IBOutlet weak var viewForTextView: UIView!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var textView: UITextView!


	override func viewDidLoad() {
		super.viewDidLoad()

		viewForTextView.layer.borderWidth = 1
		viewForTextView.layer.cornerRadius = 8
		viewForTextView.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
	}

	@IBAction func saveTapped(_ sender: UIBarButtonItem) {

	}

}

