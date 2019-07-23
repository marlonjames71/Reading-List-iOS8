//
//  Book.swift
//  Reading-List-2
//
//  Created by Marlon Raskin on 7/23/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


struct Book: Equatable, Codable {
	var title: String
	var reasonToRead: String
	var hasBeenRead: Bool

	init(title: String, reasonToRead: String, hasBeenRead: Bool = false ) {
		self.title = title
		self.reasonToRead = reasonToRead
		self.hasBeenRead = hasBeenRead
	}
}
