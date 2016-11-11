

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




