

// TODO: Make an enum that reflects the dict keys?

import Foundation


	struct defaultsKeys {
		static let keyOne = "firstStringKey"
		static let keyTwo = "secondStringKey"
	}


	let defaults = UserDefaults.standard

	defaults.setValue("Some String Value",		forKey: defaultsKeys.keyOne)
	defaults.setValue("Another String Value", forKey: defaultsKeys.keyTwo)

	defaults.synchronize()


	let defaults2 = UserDefaults.standard

	 if let stringOne = defaults2.string(forKey: defaultsKeys.keyOne){
		print(stringOne) // Some String Value
		}


	if let stringTwo = defaults2.string(forKey: defaultsKeys.keyTwo) {
		print(stringTwo) // Another String Value
	}

// MARK: -
func intro() {

	lineCount: do {
		for i in 0...100 { print(i) }
		print("What top number do you see?")
		let result = Int(readLine()!)
		gLines = 100-result!

		clear()
		print("hi")
	}

}; // intro()



func menutestagain() {
	_ = Shop.loadShop(keepName: "Fred",
	                      shopFileName: Shop.shopFileName,
	                      newKeepTemplate: Shop.newKeepTemplate)

	print(Shop.loadArray(fromPlist: Shop.loadPlist(shopFileName: Shop.shopFileName, newKeepTemplate: Shop.newKeepTemplate))!)

	print(Shop.currentListOfKeeps!)
	
}

func menu() {
	// Menu stuff:
	var menu = 0; while menu == 0 {
		// Globals!: call the shop whatever the scene name is... or if using SKNode then gShop
		var gShop: Shop?
		var gPlayer: Player?

		func applyChanges(to shop: Shop) {
			if gShop == nil { print("error, gShop is nil")
			} else { gShop = shop }
		}

		// Handy items:
		let bow = Item(name: "Bow", value: 50, maxQty: 3)

		dmv: do {
			// Load a shop or set one up:
			gShop = Shop(money: 500, name: "My Shop")
			gShop!.addItem(bow)

			gPlayer = Player()
			gPlayer!.inventory[bow] = 1

		}

		tb: do {
			/* Clicked "sell item" node: */
			print(c, "which item to sell?")

			/* User clicks Bow: */
			let itemSelected = bow
			gShop!.buyItem(bow, from: gPlayer!)
			gShop!.sellItem(bow, to: gPlayer!)

			printers: do { print(n,n)
				print(l, "Player's Bow Count:", gPlayer!.inventory[bow]!)
				print(l, "Player's money:", gPlayer!.money)
				print (l, "keep money:", gShop!.money)
				print(l, "Keeps bow count:", gShop!.inventory[bow]!)
				print(n,n) }
		}

		update: do {

		}

		break
	}
}

