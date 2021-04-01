//
//  CardController.swift
//  TrainingCollectionView
//
//  Created by daito yamashita on 2021/03/30.
//

import Foundation

class CardController {
    
    enum CardType{
        case monster
        case spell
    }
    
    struct Card: Hashable {
        let cost: String
        let name: String
        let effect: String
        let attack: String
        let defense: String
        let type: CardType
        let identifier = UUID()
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
    }
    
    var collections: [Card] {
        return _collections
    }
    
    init() {
        generateCollections()
    }
    
    fileprivate var _collections = [Card]()
    
    func generateCollections() {
        _collections = [
            Card(cost: "0", name: "test1", effect: "test1 effect", attack: "1", defense: "1", type: CardType.monster),
            
            Card(cost: "1", name: "test2", effect: "test2 effect", attack: "1", defense: "3", type: CardType.monster),
            Card(cost: "1", name: "test3", effect: "test3 effect", attack: "2", defense: "1", type: CardType.monster),
            Card(cost: "1", name: "test4", effect: "test4 effect", attack: "0", defense: "2", type: CardType.monster),
            Card(cost: "1", name: "test5", effect: "test5 effect", attack: "", defense: "", type: CardType.spell),

            Card(cost: "2", name: "test6", effect: "test6 effect", attack: "3", defense: "2", type: CardType.monster),
            Card(cost: "2", name: "test7", effect: "test7 effect", attack: "2", defense: "3", type: CardType.monster),
            Card(cost: "2", name: "test8", effect: "test8 effect", attack: "4", defense: "1", type: CardType.monster),
            Card(cost: "2", name: "test9", effect: "test9 effect", attack: "", defense: "", type: CardType.spell),
            Card(cost: "2", name: "test10", effect: "test10 effect", attack: "", defense: "", type: CardType.spell),

            Card(cost: "3", name: "test11", effect: "test11 effect", attack: "3", defense: "4", type: CardType.monster),
            Card(cost: "3", name: "test12", effect: "test12 effect", attack: "4", defense: "3", type: CardType.monster),
            Card(cost: "3", name: "test13", effect: "test13 effect", attack: "", defense: "", type: CardType.spell),
            
            Card(cost: "4", name: "test14", effect: "test14 effect", attack: "3", defense: "6", type: CardType.monster),
            Card(cost: "4", name: "test15", effect: "test15 effect", attack: "", defense: "", type: CardType.spell),
            Card(cost: "4", name: "test16", effect: "test16 effect", attack: "", defense: "", type: CardType.spell),
            
            Card(cost: "5", name: "test17", effect: "test17 effect", attack: "", defense: "", type: CardType.spell),
            Card(cost: "5", name: "test18", effect: "test18 effect", attack: "", defense: "", type: CardType.spell),
            
            Card(cost: "6", name: "test19", effect: "test19 effect", attack: "5", defense: "6", type: CardType.monster),
            Card(cost: "6", name: "test20", effect: "test20 effect", attack: "4", defense: "7", type: CardType.monster),

        ]
    }
}
