//
//  DailyScrum.swift
//  Tutorials
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI

//DailyScrum
//title
//atendees
//lengthInMinutes
//theme
//https://developer.apple.com/tutorials/app-dev-training/creating-the-edit-view
struct DailyScrum: Identifiable {
    var id = UUID()
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double{
        get { Double(lengthInMinutes)}
        set { lengthInMinutes = Int(newValue)}
    }
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map({ Attendee(name: $0) })
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
}


extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Yeon", "hyo", "gook", "lee"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Ji", "Sin", "Park", "Kim"],
                   lengthInMinutes: 5,
                   theme: .buttercup),
        DailyScrum(title: "Web Design",
                   attendees: ["Kim", "Euna", "Sin", "gook", "Luis"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Jenna", "Chella", "Aga", "Lucy", "Jenni"],
                   lengthInMinutes: 20,
                   theme: .poppy),
        
    ]
}
