//
//  BirthdayView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI
import SwiftData

struct BirthdayView: View {
    //State -> Query모델 객체가 변경되면 자동으로 업데이트됨
    //데이터를 쉽게 가져올 수 있도록 하기 위해서 Query 키워드 사용
    //자동으로 업데이트 상태 유지하는 역할
    //birthday 속성을 기준으로 정렬해서 가져옴
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    //@Environment SwiftUI에서 환경 변수를 사용해서 SwiftData 모델 컨텍스트를 가져오는것 의미
    //\.modelContext 키 경로로 현재 환경에서 모든 컨텍스트를 참조할 수 있음
    //사용시 데이터 베이스 작업인 삭제/삽입/업데이트를 수행할 수 있는 모델 컨텍스트를 가져올 수 있음
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now //2000년 1월 4일 0:00:00 UTC
    
    var body: some View {
        NavigationStack {
            //SwiftData는 데이터와 별도로 고유한 ID를 제공하기 때문에 List에서 아규먼트 중 id를 제거해도됨
            List(friends) { friend in
                HStack {
                    
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(friend.name)
                        .bold(friend.isBirthdayToday)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthday")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20, content: {
                    Text("New Birthday")
                        .font(.headline)
                    
//                    DatePicker(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, selection: <#T##Binding<Date>#>, in: <#T##ClosedRange<Date>#>, displayedComponents: <#T##DatePicker<Text>.Components#>)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                })
                .padding()
                .background(.bar) //툴바와 같은 배경 스타일링
            }
//            .task {
//                context.insert(Friend(name: "Elton Lin", birthday: .now))
//                context.insert(Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)))
//            }
        }
    }
}

#Preview {
    BirthdayView()
        //미리보기는 새로 고칠 때마다 동일한 초기상태에서 시작하기 때문에
        //modelContainer에 inMemory ture로 설정해서 앱이 메모리에 있는 동안 저장되도록 설정
        .modelContainer(for: Friend.self, inMemory: true)
}
