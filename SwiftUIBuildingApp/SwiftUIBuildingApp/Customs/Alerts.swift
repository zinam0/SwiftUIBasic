//
//  Alerts.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/31/24.
//

import SwiftUI

func customAlert(title: String, message: String) -> Alert {
    return Alert(
        title: Text(title),
        message: Text(message),
        dismissButton: .default(Text("OK"))
    )
}
