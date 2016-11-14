//
//  player.swift
//  TexAgain
//
//  Created by Dude Guy on 11/13/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

class playa1 {
	var hp = 2
	func zep() { hp = 5 }
}

class playa2: playa1 {
	override func zep() {
		hp = 6
		super.zep()
	}
}

