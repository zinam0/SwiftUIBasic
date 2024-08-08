//
//  MainView.swift
//  FriendsFavoriteMovies
//
//  Created by Zizi on 8/8/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            FilteredMovieList()
                .tabItem {
                    Label("Movies", systemImage: "film.stack")
                }
            
            FriendList()
                .tabItem {
                    Label("Friend", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    MainView()
        .modelContainer(SampleData.shared.modelContainer)
}
