//
//  Item.swift
//  UsingStacks
//
//  Created by 남지연 on 8/1/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
