//
//  CardController.swift
//  TrainingCollectionView
//
//  Created by daito yamashita on 2021/03/30.
//

import UIKit

class CardController {
    
    enum CardType{
        case monster
        case spell
    }
    
    struct Card: Hashable {
        let cost: String
        let name: String
        let image: UIImage!
        let effect: String
        let attack: String
        let defense: String
        let type: CardType
        let identifier = UUID()
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.identifier == rhs.identifier
        }
        func contains(_ filter: String?) -> Bool {
            guard let filterText = filter else { return true }
            if filterText.isEmpty { return true }
            let lowercasedFilter = filterText.lowercased()
            return name.lowercased().contains(lowercasedFilter)
        }
    }
    
    var collections: [Card] {
        return _collections
    }
    
    init() {
        generateCollections()
    }
    
    func filteredCards(with filter: String? = nil, limit: Int? = nil) -> [Card] {
        let filtered =  _collections.filter { $0.contains(filter)}
        if let limit = limit {
            return Array(filtered.prefix(through: limit))
        } else {
            return filtered
        }
        
    }
    
    fileprivate var _collections = [Card]()
    
    func generateCollections() {
        _collections = [
            Card(cost: "0", name: "test1", image: UIImage(named: "Elephant"), effect: "test1 effect", attack: "1", defense: "1", type: CardType.monster),
            
            Card(cost: "1", name: "test2", image: UIImage(named: "Elephant"), effect: "test2 effect", attack: "1", defense: "3", type: CardType.monster),
            Card(cost: "1", name: "test3", image: UIImage(named: "Elephant"), effect: "test3 effect", attack: "2", defense: "1", type: CardType.monster),
            Card(cost: "1", name: "test4", image: UIImage(named: "Elephant"), effect: "test4 effect", attack: "0", defense: "2", type: CardType.monster),
            Card(cost: "1", name: "test5", image: UIImage(named: "Elephant"), effect: "test5 effect", attack: "", defense: "", type: CardType.spell),

            Card(cost: "2", name: "test6", image: UIImage(named: "Elephant"), effect: "test6 effect", attack: "3", defense: "2", type: CardType.monster),
            Card(cost: "2", name: "test7", image: UIImage(named: "Elephant"), effect: "test7 effect", attack: "2", defense: "3", type: CardType.monster),
            Card(cost: "2", name: "test8", image: UIImage(named: "Elephant"), effect: "test8 effect", attack: "4", defense: "1", type: CardType.monster),
            Card(cost: "2", name: "test9", image: UIImage(named: "Elephant"), effect: "test9 effect", attack: "", defense: "", type: CardType.spell),
            Card(cost: "2", name: "test10", image: UIImage(named: "Elephant"), effect: "test10 effect", attack: "", defense: "", type: CardType.spell),

            Card(cost: "3", name: "test11", image: UIImage(named: "Elephant"), effect: "test11 effect", attack: "3", defense: "4", type: CardType.monster),
            Card(cost: "3", name: "test12", image: UIImage(named: "Elephant"), effect: "test12 effect", attack: "4", defense: "3", type: CardType.monster),
            Card(cost: "3", name: "test13", image: UIImage(named: "Elephant"), effect: "test13 effect", attack: "", defense: "", type: CardType.spell),
            
            Card(cost: "4", name: "test14", image: UIImage(named: "Elephant"), effect: "test14 effect", attack: "3", defense: "6", type: CardType.monster),
            Card(cost: "4", name: "test15", image: UIImage(named: "Elephant"), effect: "test15 effect", attack: "", defense: "", type: CardType.spell),
            Card(cost: "4", name: "test16", image: UIImage(named: "Elephant"), effect: "test16 effect", attack: "", defense: "", type: CardType.spell),
            
            Card(cost: "5", name: "test17", image: UIImage(named: "Elephant"), effect: "test17 effect", attack: "", defense: "", type: CardType.spell),
            Card(cost: "5", name: "test18", image: UIImage(named: "Elephant"), effect: "test18 effect", attack: "", defense: "", type: CardType.spell),
            
            Card(cost: "6", name: "test19", image: UIImage(named: "Elephant"), effect: "test19 effect", attack: "5", defense: "6", type: CardType.monster),
            Card(cost: "6", name: "test20", image: UIImage(named: "Elephant"), effect: "test20 effect", attack: "4", defense: "7", type: CardType.monster),

        ]
    }
}
