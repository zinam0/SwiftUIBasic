//
//  RoomDetail.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/29/24.
//

import SwiftUI

struct RoomDetail: View {
    
    let room: Room
    
    var body: some View {
        //반드시 추가 사항이 생기면 . 찍기
        Image(room.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            //old ⚠️
            .navigationBarTitle(Text(room.name), displayMode: .inline)
            .navigationTitle(Text(room.name))
            .navigationBarTitleDisplayMode(.inline)
    }
}
//NavigationView ❌ - naviBarTitle ❌
//NavigationView { RoomDetail(room: testData[0]) }
#Preview {
    NavigationView {
        RoomDetail(room: testData[0])
    }
}
