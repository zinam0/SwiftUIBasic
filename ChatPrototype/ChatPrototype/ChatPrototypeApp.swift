//
//  ChatPrototypeApp.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI
import SwiftData

@main
struct ChatPrototypeApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            BirthdayView()
                //modelContainer는 SwiftData와 SwiftUI 사이에 데이터를 관리와 변환을 담당하는 역할을 가지고 있다고 생각하면 됨
                .modelContainer(for: Friend.self)
        }
    }
}
