//
//  FeatureCard.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct FeatureCard: View {
    
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .border(.mint, width: 2)
                .frame(width: 50)
                .border(.black, width: 5)
                .padding(.trailing, 10) //이미지 옆 공간 확보
                .border(.orange, width: 2)
            
            Text(description)
            //Spacer()는 자신이 속한 스택 내에서 가능한 모든 공간을 채움
            //이를 통해 다른 뷰들이 적절한 위치에 배치되도록 조정
            Spacer()
        }
        .padding()
        //.tint 수식어는 앱의 AccentColor를 따름
        //AccentColor는 앱의 전반적인 강조 색상으로 사용
        //상호작용 가능한 요소(버튼, 토글, 링크 등)에 기본적으로 적용
//        .background(.tint, in: RoundedRectangle(cornerRadius: 12))
        .background(content: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.tint) //accentColor == tint
                .opacity(0.25)  //투명도
                .brightness(-0.4) //뷰의 밝기 40% 어둡게(음수면 어둡게 양수는 밝게)
        })
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(
        iconName: "person.2.crop.square.stack.fill",
        description: "A multiline description about a feature paired with the image on the left.")
}
