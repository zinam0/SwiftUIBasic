//
//  Order.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/31/24.
//

import SwiftUI
                        //allCases    //nameTag - 각 하나하나 고유한 id 가지게됨
enum BreadType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case white = "White"
    case wheat = "Wheat"
    case sourdough = "Sourdough"
    case rye = "Rye"
}

enum SpreadType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case none = "None"
    case butter = "Butter"
    case jam = "Jam"
    case peanutButter = "Peanut Butter"
}

enum AvocadoType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case slice = "Sliced"
    case mash = "Mashed"
}

struct Order: Identifiable {
    var id = UUID()
    var itemName: String
    var date: Date
    var bread: BreadType
    var spread: SpreadType
    var avocado: AvocadoType
    var includeSalt: Bool
    var includeRedPepperFlakes: Bool
    var quantity: Int
}


class OrderStore: ObservableObject {
    @Published var orders: [Order] = []
    
    func addOrder(itemName: String, date: Date, bread: BreadType, spread: SpreadType, avocado: AvocadoType, includeSalt: Bool, includeRedPepperFlakes: Bool, quantity: Int) {
            let newOrder = Order(itemName: itemName, date: date, bread: bread, spread: spread, avocado: avocado, includeSalt: includeSalt, includeRedPepperFlakes: includeRedPepperFlakes, quantity: quantity)
            orders.append(newOrder)
    }
}
