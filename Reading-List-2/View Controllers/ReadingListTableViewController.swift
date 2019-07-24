//
//  BookTableViewController.swift
//  Reading-List-2
//
//  Created by Marlon Raskin on 7/23/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class ReadingListTableViewController: UITableViewController {

	//MARK: - Properties

	let bookController = BookController()


	// MARK: - Lifecycle

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		title = "Reading List"
		tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		switch section {
		case 0:
			return bookController.unreadBooks.count
		default:
			return bookController.readBooks.count
		}
    }


	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

		switch section {
		case 0:
			if bookController.unreadBooks.count == 1 {
				return "You have \(bookController.unreadBooks.count) book in your list to read:"
			} else {
				return "You have \(bookController.unreadBooks.count) books in your list to read:"
			}
		default:
			if bookController.readBooks.count == 1 {
				return "You have read \(bookController.readBooks.count) book from your list"
			} else {
				return "You have read \(bookController.readBooks.count) books from your list"
			}
		}
	}


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }

		cell.delegate = self
		cell.book = bookFor(indexPath: indexPath)

        return cell
    }


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			let book = bookFor(indexPath: indexPath)
			bookController.deletBook(book: book)
			tableView.deleteRows(at: [indexPath], with: .fade)
    	}
	}


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == "ShowBookDetailSegue" {
			guard let detailVC = segue.destination as? BookDetailViewController,
			let indexPath = tableView.indexPathForSelectedRow else { return }
			detailVC.book = bookFor(indexPath: indexPath)
			detailVC.bookController = bookController
		} else if segue.identifier == "AddBookSegue" {
			guard let addVC = segue.destination as? BookDetailViewController else { return }
			addVC.bookController = bookController
		}
    }


	// MARK: - Helper Methods

	private func bookFor(indexPath: IndexPath) -> Book {
		switch indexPath.section {
		case 0:
			let unreadBook = bookController.unreadBooks[indexPath.row]
			return unreadBook
		default:
			let readBook = bookController.readBooks[indexPath.row]
			return readBook
		}
	}
}

extension ReadingListTableViewController: BookTableViewCellDelegate {
	func toggleHasBeenRead(for cell: BookTableViewCell) {
		guard let indexPath = tableView.indexPath(for: cell) else { return }
		let book = bookFor(indexPath: indexPath)
		bookController.updateHasBeenRead(for: book)
		tableView.reloadData()
	}
}
