
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


final class Shop2: IsPerson {

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
    
    // Maybe make the interface options as a static struct?
}









