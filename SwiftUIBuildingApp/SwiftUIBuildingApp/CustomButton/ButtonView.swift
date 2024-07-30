//
//  ButtonView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/30/24.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack {
            Button {
                print("Button pressed")
            } label: {
                Text("Custom Button")
            }
            .buttonStyle(CustomButtonStyle())
            
            //Image(decorative: "CheckmarkGlyph")
            HStack {
                Text("Signup Complete")
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 5)
                Spacer()
            }
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.green)
                .padding(.bottom, 20)
        }

    }
}

#Preview {
    ButtonView()
}
