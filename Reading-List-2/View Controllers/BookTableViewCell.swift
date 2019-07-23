//
//  BookTableViewCell.swift
//  Reading-List-2
//
//  Created by Marlon Raskin on 7/23/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

	var delegate: BookTableViewCellDelegate?

	var book: Book? {
		didSet {
			updateViews()
		}
	}

	@IBOutlet weak var bookTitleLabel: UILabel!
	@IBOutlet weak var checkBoxButton: UIButton!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	@IBAction func checkBoxTapped(_ sender: UIButton) {
		guard let delegate = delegate else { return }
		delegate.toggleHasBeenRead(for: BookTableViewCell())
	}

	func updateViews() {
		guard let book = book else { return }
		bookTitleLabel.text = book.title
		setCheckImage(hasBeenRead: book.hasBeenRead)
	}

	func setCheckImage(hasBeenRead: Bool) {
		hasBeenRead ? checkBoxButton.setBackgroundImage(UIImage(named: "checked"), for: .normal) :
			checkBoxButton.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
	}

}
