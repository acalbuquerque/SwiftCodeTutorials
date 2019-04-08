/*
 * Generics with Swift
 * Avenue Code LLC
 * Author:  Toni Albuquerque (@acalbuquerque)
 */

// **********************
// generic Sum() example
// **********************
protocol CustomAddable {
    static func +(lhs: Self, rhs: Self) -> Self
}

func sum<T: CustomAddable>(a: T, b: T) -> T {
    return a + b
}

extension Int: CustomAddable {}
extension Double: CustomAddable {}
extension Float: CustomAddable {}

sum(a: 3, b: 4.5)

// *******************
// Restaurant example
// *******************

// Custom Protocol
protocol Orders {
    associatedtype Item
    func enqueue(item:Item)
    func dequeue() -> Item?
    func showCurrentQueue() -> [Item]
}
// Class implementation
class RestaurantOrders<Item>: Orders {
    
    var items : [Item] = [Item]()
    
    func enqueue(item: Item){
        items.append(item)
    }
    
    func dequeue() -> Item? {
        if !items.isEmpty {
            return items.removeFirst()
        }
        else {
            return nil
        }
    }
    
    func showCurrentQueue() -> [Item] {
        return items
    }
}

// Menu
enum ItalianMenu {
    case penne
    case ravioli
    case lasagna
}
enum SimpleMenu {
    case fries
    case burger
    case xBurger
    case hotdog
}
// simple orders queue
let ordersQueue = RestaurantOrders<SimpleMenu>()// This instance only accept SimpleMenu Items
ordersQueue.enqueue(item: .hotdog)
ordersQueue.enqueue(item: .fries)
ordersQueue.enqueue(item: .xBurger)
print(ordersQueue.showCurrentQueue()) // [.hotdog, .fries, .xBurger]
ordersQueue.dequeue() // remove .hotdog from our queue
print(ordersQueue.showCurrentQueue()) // [.fries, .xBurger]
ordersQueue.enqueue(item: .burger)
print(ordersQueue.showCurrentQueue()) // [.fries, .xBurger, .burger]

// italian orders queue
let italianOrdersQueue = RestaurantOrders<ItalianMenu>()// This instance only accept ItalianMenu Items
italianOrdersQueue.enqueue(item: .ravioli)
italianOrdersQueue.enqueue(item: .lasagna)
print(italianOrdersQueue.showCurrentQueue())
