//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Zizi on 8/8/24.
//

import SwiftData //데이터베이스와 상호작용할 수 있도록 도와주는 프레임워크
import Foundation
//모델 관리를 위한 샘플 데이터 설정
//@MainActor : 메인 스레드에만 보관되도록 보장하는 기능 → UI Update 관련된 메인 스레드에서 안전하게 수행하기 위해 사용
@MainActor
class SampleData {
    //싱글톤 패턴
    static let shared = SampleData()
    //데이터 모델을 관리하는 컨테이너
    //SwiftUI - SwiftData 연결하는 관리자 역할을 한다고 생각했음
    //데이터 모델 저장 및 관리 담당
    let modelContainer: ModelContainer
    
    var context: ModelContext { //계산속성
        modelContainer.mainContext //데이터 베이스와 상호작용하기 위해서 사용
    }
    
    private init() {
        //데이터베이스의 구조를 정의하고 있고 Movie 모델을 포함시키고 있음
        let schema = Schema([ //모든 데이터 모델의 스키마를 정의
            Movie.self,
            Friend.self
                            ])
        //모델의 설정을 정의
        //데이터를 메모리에만 저장하고 디스크에 영구저장❌
        //테스트나 임시 데이터 저장 유용
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            //모델 컨테이너 생성
            //스키마와 설정을 사용해서 데이터 모델을 관리할 컨테이너 생성
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    
    func insertSampleData() {
        //data add
        for movie in Movie.sampleData {
            context.insert(movie) //insert⭐️
        }
        
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        Friend.sampleData[0].favoriteMovie = Movie.sampleData[1]
        Friend.sampleData[2].favoriteMovie = Movie.sampleData[0]
        Friend.sampleData[3].favoriteMovie = Movie.sampleData[4]
        Friend.sampleData[4].favoriteMovie = Movie.sampleData[0]
        
        //data save
        do {
            try context.save()
        } catch {
            print("Sample data context failed to save")
        }
    }
    
    var movie: Movie {
        Movie.sampleData[0]
    }
    
    var friend: Friend {
        Friend.sampleData[0]
    }
}
