//
//  SwiftUIView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/30/24.
//

import SwiftUI
import Combine
//iOS 14
//BindableObject -> ObservableObject
                    //관찰 가능한 객체
//ObservableObject는 여러개의 @Published 속성을 가질 수 있도록하고 상태 변화를 알릴 수 있도록 하는 protocol
class PhotoStore : ObservableObject{
    //정보가 바뀔 때 변화를 알 수 있음
    @Published var photos: [Photo] {
        didSet {
            didChange.send()    //데이터 변경을 알리는 메서드
        }
    }
    
    init(photos: [Photo] = []) {
        self.photos = photos
    }
                    //메세지 전달지
    var didChange = PassthroughSubject<Void, Never>()
}
