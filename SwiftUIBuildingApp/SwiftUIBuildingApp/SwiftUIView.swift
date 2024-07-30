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
class PhotoStore : ObservableObject{
    @Published var photos: [Photo] {
        didSet { didChange.send() }
    }
    
    init(photos: [Photo] = []) {
        self.photos = photos
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
