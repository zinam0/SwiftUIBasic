//
//  extensions.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/30/24.
//

import SwiftUI
                          //ButtonStyle protocl 준수
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 19))
            .foregroundColor(configuration.isPressed ? .black : .white)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(configuration.isPressed ? Color.red : Color.blue) //press - red  not press - blue
            )
    }
}
