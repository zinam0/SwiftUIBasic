//
//  DiceView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct DiceView: View {
    //numberOfPips = Name
    //Int = Type
    //1 = Default value
    /*
     모든 앱에는 시간이 지남에 따라 변경되는 데이터 또는 상태가 있다
     앱이 상태를 변경하면 인터페이스를 업데이트해야 할 수 있다
     그러나 SwiftUI는 기본적으로 앱의 모든 속성을 모니터링하지 않음

     이 앱에서는 사람이 Roll 버튼을 탭하면 이미지를 업데이트해야함
     SwiftUI가 UI가 변경될 때 모니터링하고 업데이트하도록 하려면 @State 키워드로 속성을 표시
     */
    @State var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            //Image(systemName: "die.face.\(numberOfPips)")
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()    //상하 좌우 safeArea 안에서 늘어남
                .frame(maxWidth: 100, maxHeight: 100)//, alignment: .center)
                .aspectRatio(1, contentMode: .fit)
                //.foregroundStyle(.white)
                .foregroundStyle(.black, .white)
            Button("Roll") {
                //⚠️Cannot assign to property: 'self' is immutable
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(BorderedButtonStyle())
        }
    }
}

#Preview {
    DiceView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackgrounded)
}
