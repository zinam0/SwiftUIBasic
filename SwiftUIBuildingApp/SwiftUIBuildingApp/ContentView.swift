//
//  ContentView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/29/24.
//

import SwiftUI

struct ContentView: View {
    
    //var rooms: [Room] = testData
    
    @ObservedObject var store = PhotoStore()
    
    var body: some View {
        
        NavigationView{
            //List(store.rooms)
            List {
                Section {
                    Button(action: {
                        addRoom()
                    }, label: {
                        Text("Add Photo")
                            //.foregroundColor(Color.black)
                    })
                }
                
                Section {
                    ForEach(store.photos) { photo in
                        //예전에는 NavigationButton -> NavigationLink
                        //클로저 함수형으로 보낼 수 있음
                        NavigationLink(destination: PhotoDetail(photo: photo)) {
                            PhotoCell(photo: photo)
                        }
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationTitle(Text("Photo"))
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
        store.photos.append(Photo(spot: "hall 2", month: 2000))
    }
    
    func delete(at offsets: IndexSet) {
        store.photos.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.photos.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    Group {
        ContentView(store: PhotoStore(photos: testData))
            //.environment(\.colorScheme, .dark)
    }
}

struct PhotoCell: View {
    
    var photo: Photo
    var body: some View {
        HStack {
            //각 이미지가 있다면
                Image(photo.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .foregroundStyle(.tint)
            
            VStack(alignment: .leading) {
                Text(photo.spot)
                Text("\(photo.month) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}
