//
//  UsingStacksApp.swift
//  UsingStacks
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI
import SwiftData

@main
struct UsingStacksApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            //MeetingView()
            ScrumView(scrums: DailyScrum.sampleData)
        }
        //.modelContainer(sharedModelContainer)
    }
}
