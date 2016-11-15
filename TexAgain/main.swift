
import Foundation

/* what I need:

- shop gold and rare item data

- player stats, items, quests, etc

- true/false stuff for special events in old towns

- dialogue ID for npc 


things for /random unknown data\ will be different!
*/

// Globes:
var gBank = 200
var gSaveFile = UserDefaults.standard

// Saver:
class GameData: Sav,er {


	// MARK: - Static stuff:

	private init(newOne: Bool ) {}

	static var instance = GameData(newOne: true)

	/// Update instance
	static func fetchFromFile() {

		// Coder stuff:
		let unusableGameData = gSaveFile.object(forKey: "GameData") as! Data
		let usableGameData = NSKeyedUnarchiver
			.unarchiveObject(with: unusableGameData) as! GameData

		GameData.instance = usableGameData
	}


	// MARK: - Data to save:

	var bank = gBank


	// MARK: - Methods:

	func say() { print(bank)	}

	/// Mutate our fields:
	func saveSelfToFile() {

		// Fetch new data from globes:
		bank = gBank

		// Coder stuff:
		let newlySavedSelf: Data = NSKeyedArchiver.archivedData(withRootObject: self)
		gSaveFile.set(newlySavedSelf, forKey: "GameData")
	}


	// MARK: - Coder stuff:

	/// Save from self:
	func encode(with aCoder: NSCoder) {
		let gameSaver = aCoder

		gameSaver.encode(bank, forKey: "bank")
	}

	/// Used in required init:
	init(loadAll: Bool,
	     bank: Int) {

		self.bank = bank
	}

	/// Load from save:
	required convenience init?(coder aDecoder: NSCoder) {
		let savedData = aDecoder // For sanity

		let bank = savedData.decodeInteger(forKey: "bank")

		self.init(loadAll: true,
		          bank: bank)
	}

}



gBank -= 100

print(gBank)



print(n)
