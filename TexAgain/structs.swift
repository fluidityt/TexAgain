
import Foundation

func == (lhs: Item, rhs: Item) -> Bool  { if lhs.hashValue != rhs.hashValue { return false }; return true }

struct Item: Hashable, Equatable { 
    let name: String
    let value: Int
    let maxQty: Int 
   
    var hashValue: Int {
    return 5.hashValue ^ (2.hashValue &* 987654433)
  }
}
  

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
}
 
class IsPerson: HasInventory {
    var name: String = ""
    var money: Int = 0
    
}
  
final class Player: IsPerson {

}


final class Shop: IsPerson {

    func shopMod(_ inter: Int,_ dubber: Double) -> Int { return Int(Double(inter) * dubber) }
   
    var shopSize: Double = 2.0 // maybe make this a sqFt based on item sqFt
    var shopPays:   Double = 0.5 // Maybe some mod of player's stats?
    var playerPays: Double = 1.0
    
    func restock(_ item: Item){
        if inventory[item] != nil { inventory[item] = item.maxQty }
        else { print("Item doesn't exist-- .addItem first") }
    }
    
    func restockAll() {  for key in inventory.keys  {restock(key)}   }

    func buyItem(_ item: Item, from player: Player) {
        // TODO: Add player in pram
        // TODO: Add min/maxes in logic
        // TODO: Add choice / refuse
        // NOTE: Player must already have item, so no need to check
        
        let price = shopMod(item.value, shopPays)
        let max   = shopMod(item.maxQty, shopSize)
        
        if player.inventory[item]! <= 0 { print("error, player has no item to sell"); fatalError() } 
        // if player.money < price 
        if (money >= price) && (inventory[item]! < max) { 
            
            money -= price
            inventory[item]? += 1
            
            // Side effects:
            player.inventory[item]! -= 1
            player.money +=  price
            
            print("- I'll take that \(item.name) off your hands..")
        } 
        
        else { print ("- Sorry--no thanks") }
    }
    
    func sellItem(_ item: Item, to player: Player) {
        
        let price = shopMod(item.value, playerPays)
        let max = item.maxQty
        
        if player.inventory[item]! >= max { print(s, "You can't carry any more!"); return } 
        if inventory[item]! <= 0 { print(s, "I don't have any more"); return }
        
        if player.money < price { print ("You can't afford that!"); return }
            
        inventory[item]! -= 1
        money +=  price
            
        // Side effects:
        player.money -= price
        player.inventory[item]? += 1
            
        print("- Here's your", item.name)
       
    }
    
    
    func greeting_NM() { print("- Hello, traveler! Welcome to \(name)") }
    
    
    
    init(money: Int, name: String) { 
        super.init()
        self.money = money
        self.name  = name
    }
    
    // TODO: Maybe make the interface options as a static struct?
}

// Static funcs:
extension Shop {

	/** Loads a plist into a dict
	- TODO: Make this into a try / catch?: */
	static func loadPlist(shopFileName: String, newKeepTemplate: String) -> Dictionary<String, Any> {

		// Logic fodder:
		let plistPath: String = { // Get path:

			let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
			                                                .userDomainMask, true)
			let documentsPath = paths[0] as NSString

			return documentsPath.appendingPathComponent(shopFileName)
		}()

		// Returner:
		let plDict: Dictionary<String, Any>? = {

			if (FileManager.default.fileExists(atPath: plistPath)) {
				let plDictV2 = NSDictionary(contentsOfFile: plistPath)!
				var plDictV3 = plDictV2 as! Dictionary<String, Any>
				plDictV3[newKeepTemplate] = nil // Because we don't need this

				return plDictV3
			}
			else { return nil }
		}()

		// Logic:
		if plDict == nil { fatalError("\(shopFileName) not found!") }
		else { return plDict! }
	}


	/** Parses plist and returns a key (put in the shopkeeper to load) (PURE) */
	static func loadShop(keepName: String, shopFileName: String, newKeepTemplate: String) -> Any {
		let plDict = loadPlist(shopFileName: shopFileName, newKeepTemplate: newKeepTemplate)
		if plDict[keepName] == nil { fatalError("\(keepName) not found!") }
		return plDict[keepName]!
	}


	/** Auto sorts stuff into an enum:
	- TODO: Make an entry that keeps a list of all the names of the shopkeeps */
	static func loadArray(fromPlist plist: Any) -> [String]? {

		let dict = loadPlist(shopFileName: shopFileName, newKeepTemplate: newKeepTemplate)

		if let array = dict[arrayName] as? [String] {

			for i in array {
				print(i)
			}
			return array
		}
		else { return nil }
	}


	/* Fields: */
	static let shopFileName = "ShopKeepInfo.plist" 	// These match-up to the filename and
	static let newKeepTemplate = "newKeepTemplate"	// main keys in the actual plist.
	static let arrayName = "listOfShopKeepers"

	/* Properties: */
	static var currentListOfKeeps: [String]? { get {
		if let list = loadArray(fromPlist: loadPlist(shopFileName: shopFileName, newKeepTemplate: newKeepTemplate)) {
			return list
		} else { return nil }}
	}

}









