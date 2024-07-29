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
            .navigationBarTitle(Text(room.name))
            
    }
}

#Preview {
    //NavigationView ❌ - naviBarTitle ❌
    NavigationView { RoomDetail(room: testData[0]) }
    //RoomDetail(room: <#Room#>)
}
