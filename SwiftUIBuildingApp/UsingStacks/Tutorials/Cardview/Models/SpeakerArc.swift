//
//  SpeakerArc.swift
//  Tutorials
//
//  Created by 남지연 on 8/6/24.
//

import SwiftUI


struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int


    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }


    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        //호를 그리는 메서드
        //clockwise : 시계 방향 여부
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
