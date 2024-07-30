//
//  Room.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/29/24.
//

import SwiftUI

              //you could define a User type with an id property that is stable across your app and your app’s database storage
              //식별 가능 : 각각 고유한 이름표
struct Photo : Identifiable {
    var id = UUID()
    var spot: String
    var month: Int
    var hasVideo: Bool = false
    
    var imageName: String { return spot }
    var thumbnailName: String { return spot + "Thumb" }
}

#if DEBUG
let testData = [
    Photo(spot: "1", month: 6, hasVideo: true),
    Photo(spot: "2", month: 8, hasVideo: false),
    Photo(spot: "3", month: 16, hasVideo: true),
    Photo(spot: "4", month: 10, hasVideo: true),
    Photo(spot: "5", month: 12, hasVideo: false),
    Photo(spot: "6", month: 8, hasVideo: false),
    Photo(spot: "7", month: 10, hasVideo: true),
    Photo(spot: "8", month: 7, hasVideo: false),
    Photo(spot: "9", month: 1, hasVideo: false),
]
#endif
