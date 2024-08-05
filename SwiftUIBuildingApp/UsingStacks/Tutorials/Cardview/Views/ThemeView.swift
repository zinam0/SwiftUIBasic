//
//  ThemeView.swift
//  Tutorials
//
//  Created by 남지연 on 8/2/24.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor) //.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)⚠️
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    ThemeView(theme: .bubblegum)
}
