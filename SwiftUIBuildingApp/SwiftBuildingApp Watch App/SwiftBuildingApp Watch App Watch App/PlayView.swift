//
//  PlayView.swift
//  SwiftBuildingApp Watch App Watch App
//
//  Created by 남지연 on 7/31/24.
//

import SwiftUI
import Combine

struct PlayButton: View {
    @State private var isPlaying: Bool = false
    var body: some View {
        VStack {
            Text("music title").foregroundStyle(isPlaying ? .white : .gray)
                .font(.title)
            Text("showTitle")
                .foregroundStyle(.gray)
                .font(.caption)
            
            Spacer()
            
            PlayView(isPlaying: $isPlaying)
        }
    }
}

#Preview {
    PlayButton()
}

struct PlayView: View {
    @Binding var isPlaying: Bool
    @StateObject private var timeManager = TimeManager()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    timeManager.skipBackward()
                }){
                    Image(systemName: "gobackward.30")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .buttonStyle(PlainButtonStyle())
                
                // self.isPlaying.toggle()
                Button(action: {
                    // 버튼이 클릭될 때 실행할 액션
                    withAnimation {
                        isPlaying.toggle()
                        if isPlaying { timeManager.startTimer() }
                        else { timeManager.stopTimer() }
                    }
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                }
                .buttonStyle(PlainButtonStyle()) //뒷 그레이 배경 사라짐
                .padding()
                
                Button(action: {
                    timeManager.skipForward()
                }){
                    Image(systemName: "goforward.30")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .buttonStyle(PlainButtonStyle())
            }
            Text(formatTime(timeManager.currentTime))
                .font(.footnote)
                .padding(.top, 10)
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


