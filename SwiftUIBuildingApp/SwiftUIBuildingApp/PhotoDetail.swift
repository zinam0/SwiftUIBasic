//
//  RoomDetail.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/29/24.
//

import SwiftUI

struct PhotoDetail: View {
    
    let photo: Photo
    //@State?
    //뷰의 상태를 저장하고 관리하기 위한 속성 래퍼(property wrapper)
    //상태가 변경될 때 마다 해당 상태 사용하는 뷰를 다시 자동적으로 다시 렌더링하여 UI 최신 상태 유지
    //view's Data
    //상태를 저장하고 관리 (예를들어 전자기기 켜짐과 꺼짐 상태 관리)
    @State private var zoomed = false
    var body: some View {
        //반드시 추가 사항이 생기면 . 찍기
        ZStack(alignment: .topLeading) {
            Image(photo.imageName)
                .resizable()
            //.aspectRatio(contentMode: .fill)
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
            //old ⚠️
            //.navigationBarTitle(Text(room.name), displayMode: .inline)
                .navigationTitle(Text(photo.spot))
                .navigationBarTitleDisplayMode(.inline)
                .onTapGesture { //tapAction -> onTapGesture
                    //animation이 없다면 바로 커지거나 작아짐
                    //withAnimation { self.zoomed.toggle() }
                    withAnimation(.easeInOut(duration: 2)) {
                        self.zoomed.toggle()
                    }
                } .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            if photo.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        }
    }
}
//NavigationView ❌ - naviBarTitle ❌
//NavigationView { RoomDetail(room: testData[0]) }
#Preview {
    Group {
        NavigationView { PhotoDetail(photo: testData[1]) }
    }
    
}
