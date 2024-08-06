//
//  EarthquakesApp.swift
//  Earthquakes
//
//  Created by Zizi on 8/6/24.
//

import SwiftUI

@main
struct EarthquakesApp: App {
    @StateObject var quakesProvider = QuakesProvider()
    var body: some Scene {
        WindowGroup {
            Quakes()
                .environmentObject(quakesProvider)
        }
    }
}
