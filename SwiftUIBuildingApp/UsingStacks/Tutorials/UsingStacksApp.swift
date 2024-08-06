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
    //@State private var scrums = DailyScrum.sampleData
    
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            //MeetingView()
            //ScrumView(scrums: $scrums)
            
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        //fatalError(error.localizedDescription)
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    //fatalError(error.localizedDescription)
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
        //.modelContainer(sharedModelContainer)
    }
}
