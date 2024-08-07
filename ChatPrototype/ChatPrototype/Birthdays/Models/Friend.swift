//
//  Friend.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import Foundation
//종료해도 사라지지 않도록 하는 도구를 제공
import SwiftData

//실행 간에도 뷰 계층 외부의 앱 상태를 나타내는데 복잡한 application을 조립하기 위한 또 다른 강력한 도구가 생김
@Model // 매크로 주석 추가
//class 모델로 변환해야함 - 참조 타입으로 여러 곳에서 참조할 수 있고 데이터 일관성 유지하는데 유리함
//값 타입은 복사될 때 마다 인스턴스가 새로 생성되기 때문에 데이터 일관성 유지와 메모리 효율성 면에서 클래스보다 적합하지 않음
//객체를 고유하게 식별해야하기 때문에 클래스는 고유한 식별자를 가질 수 있음
class Friend {
    let name: String
    let birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
