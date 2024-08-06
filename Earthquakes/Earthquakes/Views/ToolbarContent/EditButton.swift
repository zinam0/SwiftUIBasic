//
//  EditButton.swift
//  Earthquakes
//
//  Created by Zizi on 8/6/24.
//

import SwiftUI

struct EditButton: View {
    @Binding var editMode: EditMode
    var action: () -> Void = {}
    var body: some View {
        Button {
            withAnimation {
                if editMode == .active {
                    action()
                    editMode = .inactive
                } else {
                    editMode = .active
                }
            }
        } label: {
            if editMode == .active {
                Text("Cancel").bold()
            } else {
                Text("Edit")
            }
        }

    }
}

#Preview {
    EditButton(editMode: .constant(.inactive))
        .previewLayout(.sizeThatFits)
}
