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
        Image(room.imageName)
            //.resizable()
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    //RoomDetail()
    RoomDetail(room: testData[0])
}
