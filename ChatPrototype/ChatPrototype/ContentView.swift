//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            //만약 빈 문자열 이면 표시할 텍스트가 없습니다
            Text("Hello, world!")
                .padding()  //좌우상하
                .background(.yellow, in: RoundedRectangle(cornerRadius: 8))
            Text("Knock, Knock")
                .background(.green, in: RoundedRectangle(cornerRadius: 8))
                .padding()
            Text("Who's there")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
