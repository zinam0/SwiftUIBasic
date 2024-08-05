//
//  ScrumTimer.swift
//  Tutorials
//
//  Created by 남지연 on 8/2/24.
//

import Foundation

//일일 스클머 회의를 위한 타이머
//총 회의시간 / 각 발표자 시간 / 현재 발표자 이름 추적
@MainActor //UI와 관련된 코드는 메인 스레드에서 실행되어야 하므로 @MainActor를 사용해야함
final class ScrumTimer: ObservableObject {  //ObservableObject : Class에서 사용하는 감시자역할(SwiftUI View - Data연결)
    //회의 참석자 추적
    struct Speaker: Identifiable {  //Identifiable 프로토콜을 준수해서 리스트에서 고유하게 식별될 수 있음
        let name: String
        var isCompleted: Bool
        let id = UUID()
    }
    
    //@Published 속성을 사용하여 변경 시 UI 업데이트
    //발언 중 참석자 이름
    @Published var activeSpeaker = ""
    //회의 시작 이후 경과된 초
    @Published var secondsElapsed = 0
    //모든 참석자가 발언을 마칠 때까지 남은 초
    @Published var secondsRemaining = 0
    //발언 순서대로 나열된 모든 참석자 - 외부에서 읽기만 가능하도록 설정
    private(set) var speakers: [Speaker] = []
    
    //스크럼 회의 길이
    private(set) var lengthInMinutes: Int
    //새로운 참석자 발언 시작할 때 실행 클로저
    var speakerchangedAction: (()->Void)?
    
    private weak var timer: Timer?  //약한 참조를 사용해서 메모리 누수를 방지
    private var timerStopped = false
    private var frequency: TimeInterval { 1.0 / 60.0 } //타이머 주기
    private var lengthInSeconds: Int { lengthInMinutes * 60 } //회의 길이를 초단위로 변환
    private var secondsPerSpeaker: Int { (lengthInMinutes * 60) / speakers.count }
    private var secondsElapsedForSpeaker: Int = 0                                   //스피커가 발언한 시간 초 단위
    private var speakerIndex: Int = 0                                               //현재 발언 중인 스피커 인덱스
    private var speakerText: String { return "Speaker \(speakerIndex + 1)" + speakers[speakerIndex].name }
    private var startDate: Date?                                                    //타이머 시작 시간
    
    //회의 길이 참석자 리스트
    init(lengthInMinutes: Int = 0, attendees: [DailyScrum.Attendee] = []) {
        self.lengthInMinutes = lengthInMinutes
        self.speakers = attendees.speakers
        secondsRemaining = lengthInSeconds
        activeSpeaker = speakerText
    }
    
    //타이머 시작
    func startScrum() {
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true, block: { [weak self] timer in
            self?.update()
        })
        timer?.tolerance = 0.1
        changeToSpeaker(at:0)
    }
    //타이머 중지
    func stopScrum() {
        timer?.invalidate()
        timerStopped = true
    }
    //타이머 다음 발표자에게 넘김
    nonisolated func skipSpeaker() {
        Task{ @MainActor in
            changeToSpeaker(at: speakerIndex + 1)
        }
    }
    
    //스피커 업데이트 메서드
    private func changeToSpeaker(at index: Int) {
        if index > 0 {
            let previousSpeakerIndex = index - 1
            speakers[previousSpeakerIndex].isCompleted = true
        }
        secondsElapsedForSpeaker = 0
        guard index < speakers.count else { return }
        speakerIndex = index
        activeSpeaker = speakerText
        
        secondsElapsed = index * secondsPerSpeaker
        secondsRemaining = lengthInSeconds - secondsElapsed
        startDate = Date()
    }
    //타이머 주기적으로 호출될 때 실행되는 메서드
    //동시성 모델에서 사용되는 키워드 - 특정 함수나 메서드가 특정 actor 규칙을 따르지 않는다는 것을 나타냄 
    nonisolated private func update() {
        //비동기로 작업하고 @MainActor를 사용해서 메인 스레드에서 실행되도록 함
        Task { @MainActor in
            guard let startDate,
                  !timerStopped else { return } //타이머 정지 확인
            let secondsElapsed = Int(Date().timeIntervalSince1970 - startDate.timeIntervalSince1970)
            secondsElapsedForSpeaker = secondsElapsed
            self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
            guard secondsElapsed <= secondsPerSpeaker else { return }
            secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)
            
            if secondsElapsedForSpeaker >= secondsPerSpeaker {
                changeToSpeaker(at: speakerIndex + 1)
                speakerchangedAction?()
            }
        }
    }
    
    //새로운 회의길이와 참석자 타이머를 리셋합니다
    func reset(lengthInMinutes: Int, attendees: [DailyScrum.Attendee]) {
        self.lengthInMinutes = lengthInMinutes
        self.speakers = attendees.speakers
        secondsRemaining = lengthInSeconds
        activeSpeaker = speakerText
    }
}

//발표자 반환하는 기능 추가
extension Array<DailyScrum.Attendee> {
    var speakers: [ScrumTimer.Speaker] {
        if isEmpty {
            return [ScrumTimer.Speaker(name: "Speaker 1", isCompleted: false)]
        } else {
            return map { ScrumTimer.Speaker(name: $0.name, isCompleted: false)}
        }
    }
}
