//
//  Theme.swift
//  Tutorials
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI

//Theme or ColorAsset이름은 정하기 나름
enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    //custom 색 사용하고 싶다면?
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized        //앞 자 대문자로 변환해주고 문자열로 변환해주는 기능
    }
}


