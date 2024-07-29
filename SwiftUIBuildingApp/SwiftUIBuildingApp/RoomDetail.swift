//
//  RoomDetail.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/29/24.
//

import SwiftUI

struct RoomDetail: View {
    
    let room: Room
    //@State?
    //뷰의 상태를 저장하고 관리하기 위한 속성 래퍼(property wrapper)
    //상태가 변경될 때 마다 해당 상태 사용하는 뷰를 다시 자동적으로 다시 렌더링하여 UI 최신 상태 유지
    //view's Data
    @State private var zoomed = false
    var body: some View {
        //반드시 추가 사항이 생기면 . 찍기
        ZStack(alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                //old ⚠️
                //.navigationBarTitle(Text(room.name), displayMode: .inline)
                .navigationTitle(Text(room.name))
                .navigationBarTitleDisplayMode(.inline)
                .onTapGesture { //tapAction -> onTapGesture
                    //animation이 없다면 바로 커지거나 작아짐
                    withAnimation { self.zoomed.toggle() }
                }
            
            Image(systemName: "video.fill")
                .font(.title)
                .padding(.all)
        }
    }
}
//NavigationView ❌ - naviBarTitle ❌
//NavigationView { RoomDetail(room: testData[0]) }
#Preview {
    NavigationView {
        RoomDetail(room: testData[0])
    }
}
