//
//  MeetingView.swift
//  UsingStacks
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill" )
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }//세부 요소 설명은 하지 않음 설정
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")
                //VoiceOver가 이미 버튼 이라고 말하기 때문에 Button문구를 추가할 필요가 없습니다
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
