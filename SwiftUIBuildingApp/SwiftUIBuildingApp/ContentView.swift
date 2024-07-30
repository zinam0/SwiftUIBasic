//
//  ContentView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    
    //var rooms: [Room] = testData
    
    @ObservedObject var store = RoomStore()
    
    var body: some View {
        
        NavigationView{
            //List(store.rooms)
            List {
                Section {
                    Button(action: {
                        addRoom()
                    }, label: {
                        Text("Add Room")
                            .foregroundColor(Color.black)
                    })
                }
                
                Section {
                    ForEach(store.rooms) { room in
                        //예전에는 NavigationButton -> NavigationLink
                        //클로저 함수형으로 보낼 수 있음
                        NavigationLink(destination: RoomDetail(room: room)) {
                            RoomCell(room: room)
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationTitle(Text("Rooms"))
            //.navigationBarItems(trailing: EditButton()) ⚠️
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                        EditButton()
                }
            }
            
            
            .listStyle(.grouped)
            
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "hall 2", capacity: 2000))
    }
    
    func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView(store: RoomStore(rooms: testData))
}

struct RoomCell: View {
    
    var room: Room
    var body: some View {
        HStack {
            //각 이미지가 있다면
            //            Image(room.imageName)
            //                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)  //둥글게 표현하기(UIKit)과 동일
            //                .imageScale(.small)
            
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
