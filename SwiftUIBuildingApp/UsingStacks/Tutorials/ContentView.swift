//
//  ContentView.swift
//  UsingStacks
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI


enum SceneType {
    case meeting
    case scrum
}

struct ContentView: View {
    @State private var currentScene: SceneType? = nil

    var body: some View {
        NavigationView {
            VStack {
            
            }
        }
       
    }
    
    @ViewBuilder
    private func viewForScene(_ scene: SceneType?) -> some View {
        switch scene {
        case .meeting:
            MeetingView()
        case .scrum:
            ScrumView(scrums: DailyScrum.sampleData)
        case nil:
            Text("select view")
        }
    }
}

#Preview {
    ContentView()
      
}
