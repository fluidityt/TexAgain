
import Foundation

// Menu stuff:
var menu = 0; while menu == 0 {
    // Globals!: call the shop whatever the scene name is... or if using SKNode then gShop
    var gShop: Shop2?
    var gPlayer: Player?
    
    func applyChanges(to shop: Shop2) { 
        if gShop == nil { print("error, gShop is nil")
        } else { gShop = shop }
    }
    
    // Handy items:
    let bow = Item(name: "Bow", value: 50, maxQty: 3)
  
    dmv: do {
        // Load a shop or set one up:
        gShop = Shop2(money: 500, name: "My Shop")
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
//
// let path = NSBundle.mainBundle().pathForResource("GameData", ofType: "plist") //parse GameData.plist
//        let dict:AnyObject = NSDictionary(contentsOfFile: path!)
//        let gameDict:AnyObject = dict.objectForKey("GameSettings")!
//        


func loadShop(keepName: String) -> Dictionary<String, Any>? {

	// Config for as we mod the plist manually
	let shopFileName = "ShopKeepInfo.plist"
	let newKeepTemplate = "newKeepTemplate"

	func getPath(plistName: String = shopFileName) -> String {

		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory,
		                                                .userDomainMask, true)
		let documentsPath = paths[0] as NSString
		let plistPath = documentsPath.appendingPathComponent(plistName)

		return plistPath
	}

	func grabPlist(plistPath: String = getPath()) -> Dictionary<String, Any>? {

		// shopFileName Found:
		if ( FileManager.default.fileExists(atPath: plistPath) ) {
			let plDict1 = NSDictionary(contentsOfFile: getPath())!
			var plDict2 = plDict1 as! Dictionary<String, Any>

			plDict2[newKeepTemplate] = nil

			return plDict2
		}
			// Not found:
		else {
			return nil
		}
	}

	if grabPlist() == nil { fatalError("\(shopFileName) not found!") }

	return grabPlist()
	
}
