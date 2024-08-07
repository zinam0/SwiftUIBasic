//
//  GroupView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

let gradientColor: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct GroupView: View {
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesPage()
            CircleView()
        }
        .background(Gradient(colors: gradientColor))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    GroupView()
}
