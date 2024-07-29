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
class RoomStore : ObservableObject{
    @Published var rooms: [Room] {
        didSet { didChange.send() }
    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
