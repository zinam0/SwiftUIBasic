//
//  LoadingView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var numberOfDice: Int = 1
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps()) //소문자 스몰캡 형식으로 표시하도록 하는 텍스트 스타일
                .foregroundStyle(.white)
            
            HStack {
                //                DiceView()
                //                DiceView()
                //                DiceView()
                
                //id : 각 항목을 식별하기 위해 사용되는 키 경로
                //description은 CustomStringConvertible 프로토콜을 준수하는 객체에 기본적으로 제공되는 속성 → 각 숫자의 문자열 표현을 반환
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            
            HStack {
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    numberOfDice -= 1
                }
                .disabled(numberOfDice == 1)
                
                Button("AddDice", systemImage: "plus.circle.fill", action: {
                    numberOfDice += 1
                })
                .disabled(numberOfDice == 5)
                
            }
            .padding()
            .labelStyle(.iconOnly) //titleOnly
        }
        .padding()
        .border(.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackgrounded)
        //.foregroundStyle(.white)
        .tint(.white)
    }
    
}

#Preview {
    LoadingView()
}
