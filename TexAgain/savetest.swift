//
//  savetest.swift
//  TexAgain
//
//  Created by Dude Guy on 11/15/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//



// TODO: Make an enum that reflects the dict keys?
// TODO: Make a sharedpref that contains all the Team UUID to load from.. then match?


import Foundation







	func yantest32() {
		// MARK: -
		//func yantest2() {
		//	class Team: NSObject, NSCoding {
		//
		//		static let key = "team"
		//
		//		var id: Int!
		//		var name: String!
		//		var shortname: String!
		//
		//		init(id: Int, name: String, shortname: String) {
		//			self.id = id
		//			self.name = name
		//			self.shortname = shortname
		//
		//		}
		//
		//		required convenience init(coder aDecoder: NSCoder) {
		//			let id = aDecoder.decodeInteger(forKey: "id")
		//			let name = aDecoder.decodeObject(forKey: "name") as! String
		//			let shortname = aDecoder.decodeObject(forKey: "shortname") as! String
		//			self.init(id: id, name: name, shortname: shortname)
		//		}
		//
		//		func encode(with aCoder: NSCoder) {
		//			aCoder.encode(id, forKey: "id")
		//			aCoder.encode(name, forKey: "name")
		//			aCoder.encode(shortname, forKey: "shortname")
		//		}
		//	}
		//
		//	var userDefaults = UserDefaults.standard
		//
		//	func archive(team: Team) {
//		let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: team)
		//		userDefaults.set(encodedData, forKey: Team.key)
		//		userDefaults.synchronize()
		//	}
		//
		//	func unArchive() -> [Team] {
		//		let decoded  = userDefaults.object(forKey: Team.key) as! Data
		//		let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Team]
		//		return decodedTeams
		//	}
		//
		//let teamOne = Team(id: 1, name: "TeamOne", shortname: "t1")
		//archive(team: teamOne)
		//
		//let teamOneCopy = unArchive()
		//
		//
		//
		//
		//}
		//yantest2()
	}
	// MARK: -
	func yantest1() {
		struct DefaultKeys {
			var keyOne = "firstStringKey"
			var keyTwo = "secondStringKey"
			//static let keyThree = "fun"
		}
		var defk1 = DefaultKeys()
		var defKeys = ["Hello": 45]



		func save<T>(z: T) {
			let defaults = UserDefaults.standard
			defaults.setValue(z, forKey: "MyData")
			defaults.synchronize()
		}

		func load() -> Any {
			let defaults2 = UserDefaults.standard
			return defaults2.value(forKey: "MyData")!
		}

		//save(z: defKeys)
		_=load()
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
	// MARK: -
	func menutestagain() {
		_ = Shop.loadShop(keepName: "Fred",
		                  shopFileName: Shop.shopFileName,
		                  newKeepTemplate: Shop.newKeepTemplate)

		print(Shop.loadArray(fromPlist: Shop.loadPlist(shopFileName: Shop.shopFileName, newKeepTemplate: Shop.newKeepTemplate))!)

		print(Shop.currentListOfKeeps!)

	}
	// MARK: -
	func menu() {
		// Menu stuff:
		var menu = 0; while menu == 0 {
			// Globals!: call the shop whatever the scene name is... or if using SKNode then gShop
			var gShop:	 Shop?
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
				//let itemSelected = bow
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












