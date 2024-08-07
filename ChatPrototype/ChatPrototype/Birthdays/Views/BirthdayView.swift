//
//  BirthdayView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct BirthdayView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Elton Lin", birthday: .now),
        Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
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
                        friends.append(newFriend)
                    }
                    .bold()
                })
                .padding()
                .background(.bar) //툴바와 같은 배경 스타일링
            }
        }
    }
}

#Preview {
    BirthdayView()
}
