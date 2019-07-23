//
//  BookController.swift
//  Reading-List-2
//
//  Created by Marlon Raskin on 7/23/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


class BookController {
	private(set) var books = [Book]()

	init() {
		loadFromPersistentStore()
	}


	// MARK: - Book Functions

	@discardableResult func createBook(title: String, reasonToRead: String) -> Book {
		let book = Book(title: title, reasonToRead: reasonToRead)
		books.append(book)
		saveToPersistentStore()
		return book
	}

	func deletBook(book: Book) {
		guard let index = books.firstIndex(of: book) else { return }
		books.remove(at: index)
		saveToPersistentStore()
	}

	func updateHasBeenRead(for book: Book) {
		guard let index = books.firstIndex(of: book) else { return }
		books[index].hasBeenRead = !books[index].hasBeenRead
		saveToPersistentStore()
	}

	func updateBookInfo(for book: Book, title: String, reason: String) {
		guard let index = books.firstIndex(of: book) else { return }
		books[index].title = title
		books[index].reasonToRead = reason
		saveToPersistentStore()
	}


	// MARK: - Saving & Loading Data

	func saveToPersistentStore() {
		guard let url = readingListURL else { return }

		do {
			let encoder = PropertyListEncoder()
			let booksData = try encoder.encode(books)
			try booksData.write(to: url)
		} catch {
			print("Error encoding book list: \(error)")
		}
	}

	func loadFromPersistentStore() {

		do {
			guard let url = readingListURL else { return }
			let bookData = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			let decodeBooks = try decoder.decode([Book].self, from: bookData)
			books = decodeBooks
		} catch {
			print("Error decoding data: \(error)")
		}
	}


	// MARK: - Computed Properties

	private var readingListURL: URL? {
		let fm = FileManager.default
		guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return dir.appendingPathComponent("ReadingList.plist")
	}

	var readBooks: [Book] {
		return books.filter { $0.hasBeenRead }
	}

	var unreadBooks: [Book] {
		return books.filter { !$0.hasBeenRead }
	}
}
