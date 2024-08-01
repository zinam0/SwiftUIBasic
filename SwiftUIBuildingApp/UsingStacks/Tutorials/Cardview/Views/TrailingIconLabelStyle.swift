//
//  TrailingIconLabelStyle.swift
//  Tutorials
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI
//LabelStyle protocol 채택  - makeBody 필수 구현
struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

//style 쉽게 호출할 수 있음
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
