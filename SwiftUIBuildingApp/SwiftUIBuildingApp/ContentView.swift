//
//  ContentView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    var body: some View {
        VStack { //vertical
            Text("Tap Text")
            Button {
                print("Pressed")
            } label: {
                Text("Middle Button")
            }
            Text("Bottom Text")
            Toggle(isOn: $enabled) {
                Text("Enabled")
            }
            .padding(.horizontal, 100)
                
            
            Button {
                enabled.toggle()
            } label: {
                Text("Flip")
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .padding(8)
                    .background(.yellow)
                    //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/) //simple rounded corner ❌
                    //.clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.black, lineWidth: 1)
                    }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
