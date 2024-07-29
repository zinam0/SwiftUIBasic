//
//  ContentView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    
    var rooms: [Room] = testData
    
    var body: some View {
        
        NavigationView{
            List(rooms) { room in
                //예전에는 NavigationButton -> NavigationLink
                //클로저 함수형으로 보낼 수 있음
                
                NavigationLink(destination: RoomDetail(room: room)) {
                   RoomCell(room: room)
                }
                .navigationTitle(Text("Rooms"))
            }
        }
    }
}

#Preview {
    ContentView()
}

struct RoomCell: View {
    
    var room: Room    
    var body: some View {
        HStack {
            //각 이미지가 있다면
            //Image(roomthubnailName)
            //.cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)  //둥글게 표현하기(UIKit)과 동일
            
            Image(systemName: "photo")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}
