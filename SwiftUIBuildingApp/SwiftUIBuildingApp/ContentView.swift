//
//  ContentView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/30/24.
//

import SwiftUI

//ContentView는 뷰 빌더라고 알려진 특별한 종류의 클로저 내에서 선언
struct ContentView: View {
    @StateObject private var orderStore = OrderStore()
    //protocol
    var body: some View {
        TabView {
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
                .environmentObject(orderStore)
            OrderHistory()
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
                .environmentObject(orderStore)
        }
    }
}

#Preview {
    ContentView()
}
