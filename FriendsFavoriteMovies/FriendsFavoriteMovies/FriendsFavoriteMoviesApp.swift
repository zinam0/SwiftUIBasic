//
//  FriendsFavoriteMoviesApp.swift
//  FriendsFavoriteMovies
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI
import SwiftData

@main //진입점
struct FriendsFavoriteMoviesApp: App { //App Protocol 진입점
    var sharedModelContainer: ModelContainer = { //데이터 저장하고 관리하는 모델
        let schema = Schema([ //스키마 정의 (데이터 나타내는 모델)
            Movie.self,
        ])
        //데이터를 메모리에만 저장하지 않고 영구 저장소에 저장
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)") //실패 경우
        }
    }()

    var body: some Scene { //인터페이스 정의
        WindowGroup { //MovieList 뷰 표시하는 창 그룹 정의
            MovieList()
        }
        .modelContainer(sharedModelContainer) //모델 컨테이너를 뷰에 연결
    }
}
