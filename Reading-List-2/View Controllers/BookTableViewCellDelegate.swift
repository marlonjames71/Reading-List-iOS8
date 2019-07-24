//
//  BookTableViewCellDelegate.swift
//  Reading-List-2
//
//  Created by Marlon Raskin on 7/23/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


protocol BookTableViewCellDelegate: AnyObject {
	func toggleHasBeenRead(for cell: BookTableViewCell)
}
