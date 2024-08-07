//
//  FeaturesPage.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
                .padding(.top, 100) //위에서 100띄움
            
            FeatureCard(
                iconName: "person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left.")
            
            //Spacer()
            
            FeatureCard(
                iconName: "quote.bubble.fill",
                description: "Short summary")
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    FeaturesPage()
        //뷰가 상단 컨테이너의 가용 공간ㅇ르 차지하게할 때 유용
        .frame(maxHeight: .infinity) //뷰의 프레임 설정
        .background(Gradient(colors: gradientColor))
        .foregroundStyle(.white)
}
