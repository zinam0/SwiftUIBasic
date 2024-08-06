//
//  Quake+Color.swift
//  Earthquakes
//
//  Created by Zizi on 8/6/24.
//

import SwiftUI

//지진 크기에 따라서 색상 정의하고 있음
extension Quake {
    var color: Color {
        switch magnitude {
        case 0..<1:
            return .green
        case 1..<2:
            return .yellow
        case 2..<3:
            return .orange
        case 3..<5:
            return .red
        case 5..<Double.greatestFiniteMagnitude:
            return .init(red: 0.8, green: 0.2, blue: 0.7)
        default:
            return .gray
        }
    }
}
