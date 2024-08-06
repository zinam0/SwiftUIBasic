//
//  DeleteButton.swift
//  Earthquakes
//
//  Created by Zizi on 8/6/24.
//

import SwiftUI

struct DeleteButton: View {
    var action: () -> Void = {}
    var body: some View {
        Button(action: action) {
            Label("Delete", systemImage: "trash")
        }
    }
}

#Preview {
    DeleteButton()
        .previewLayout(.sizeThatFits)
}
