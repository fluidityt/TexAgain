

// MARK: -

struct Item: Hashable, Equatable { 
    let name: String
    let value: Int
    let maxQty: Int

    var hashValue: Int {    return 5.hashValue ^ (2.hashValue &* 987654433)  }
}
func == (lhs: Item, rhs: Item) -> Bool  { if lhs.hashValue != rhs.hashValue { return false }; return true }

// MARK: -

final class Player: IsPerson {

}








