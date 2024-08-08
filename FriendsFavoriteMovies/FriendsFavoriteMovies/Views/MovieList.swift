//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    //@Environment : view 환경에서 값을 주입받기 위해 사용
    //@Environment(\.modelContext) 데이터베이스와 SwiftUI View 상호작용
    @Environment(\.modelContext) private var modelContext
    //Movie.title 속성을 기준으로 정렬된 결과값을 가지고 오고 있음
    @Query(sort: \Movie.title) private var movies: [Movie]

    @State private var newMovie: Movie?
    
    var body: some View {
        NavigationSplitView {
            Group {
                if !movies.isEmpty {
                    List {
                        ForEach(movies) { movie in
                            NavigationLink { //클릭후 다음 화면
                                //                        Text(movie.title)
                                MovieDetail(movie: movie)
                            } label: {
                                Text(movie.title)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                } else {
                    ContentUnavailableView { //영화가 하나도 없을때
                        Label("No Movie", systemImage: "film.stack")
                    }
                }
            }
            .navigationTitle("Movie")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
            }
        } detail: {
            Text("Select an movie")
                .navigationTitle("Movie")
        }
    }

    private func addMovie() {
        withAnimation {
            let newItem = Movie(title: "", releaseDate: .now)
            modelContext.insert(newItem)
            newMovie = newItem
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
        //.modelContainer(for: Movie.self, inMemory: true)
}

#Preview("Empty List") {
    MovieList()
        .modelContainer(for: Movie.self, inMemory: true)
}
