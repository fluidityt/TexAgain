//
//  composition.swift
//  TexAgain
//
//  Created by Dude Guy on 11/13/16.
//


import Foundation

// MARK: -

typealias Inventory = [Item: Int]

class HasInventory {

	var inventory: Inventory = [:]

	func addItem(_ item: Item) {
		if inventory[item] == nil { inventory[item] = item.maxQty }
		else { print("Item already exists.. did you mean to buy instead?") }
	}

	func removeItem(_ item: Item) {
		if inventory[item] != nil { inventory[item] = nil }
		else { print("Item already gone.. did you mean to sell instead?") }
	}

	func addInventory(_ newInventory: [Item: Int])    { inventory = newInventory }

	func removeInventory() { inventory = [:] }

	func saveInventory(name: String) {
		let saveSuffix = "inventory"

		var namesInventory: [String: Int] = [:]
		for (item, qty) in inventory { namesInventory[item.name] = qty	}

		let defaults = UserDefaults.standard
		defaults.setValue(namesInventory, forKey: (name + saveSuffix))
		defaults.synchronize()
	}
}

// MARK: -

class IsPerson: HasInventory {
    var name: String = ""
    var money: Int = 0
    
}
