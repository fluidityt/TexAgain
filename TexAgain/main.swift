
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


// MARK: - Data to save:

	var bank = gBank


// MARK: - Keys:

	private struct Keys {
		static let
		coder = "GameData",
		bank = "bank"
	}


// MARK: - Data + Keys (encoder):

	/// Save data to a key to a file:
	func encode(with aCoder: NSCoder) {

		aCoder.encode(bank, forKey: Keys.bank)
	}


// MARK: - Inits:

	/// Basic singleton init:
	private init(newOne: Bool ) {}

	// Loading part1:
	init(loadAll: Bool,
	     bank: Int) {

		self.bank = bank
	}

	/// Loading part2:
	required convenience init?(coder aDecoder: NSCoder) {

		let savedData = aDecoder // For sanity

		let lBank = savedData.decodeInteger(forKey: Keys.bank)

		self.init(loadAll: true,
		          bank: lBank)
	}


// MARK: - Static stuff:

	// TODO: Turn this private once you don't fail:
	/// Singleton (used when .loading() from a data class)
	private static var instance = GameData(newOne: true)

	// TODO: Make this multi-saveable: (refactor saveFile to userDef and then saveFile is key)


	/// Update fields then save to file
	static func saveData (instance i: GameData = GameData.instance,
	                     to saveFile: UserDefaults) {

		// Fetch new data from globes because we need latest data to save:
		i.bank = gBank // Could be bank.save()

		// Coder stuff:
		let unusableUpdatedGameData: Data = NSKeyedArchiver.archivedData(withRootObject: i)

		// Save to file!:
		saveFile.set(unusableUpdatedGameData, forKey: Keys.coder)
	}

	/// Load, decode, then update instance's fields:
	static func loadData (saveFile: UserDefaults = gSaveFile) -> GameData {

		// Coder stuff:
		let unusableLoadedGameData = saveFile.object(forKey: Keys.coder) as! Data
		let usableLoadedGameData = NSKeyedUnarchiver
			.unarchiveObject(with: unusableLoadedGameData) as! GameData

		instance = usableLoadedGameData

		return instance
	}


}

gBank = 100
//GameData.saveData()
let data = GameData.loadData()

print(data.bank)




print(n)
