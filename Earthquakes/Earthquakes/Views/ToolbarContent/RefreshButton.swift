//
//  RefreshButton.swift
//  Earthquakes
//
//  Created by Zizi on 8/6/24.
//

import SwiftUI

struct RefreshButton: View {
    var action: () -> Void = {}
    var body: some View {
        Button {
            action()
        } label: {
            Label("Refresh", systemImage: "arrow.clockwise")
        }

    }
}

#Preview {
    RefreshButton()
}
