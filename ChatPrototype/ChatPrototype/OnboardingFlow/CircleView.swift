//
//  CircleView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct CircleView: View {
    let title: String = "MR"
    let message: String = "A multiline description about a feature paired with the image on the left."
    var body: some View {
        
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(.yellow)
                    Text(title)
                }
                Text(message)
            }
            .border(.mint, width: 2)
            .padding(.trailing, 50)
            .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                    Text(title)
                }
                .border(.black, width: 2)
                .frame(width: 40)
                .border(.mint, width: 1)
                
                
                Text(message)
            }
            .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(Color.red)
                    Text(title)
                }
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)

                Text(message)
            }.padding()
            
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(Color.green)
                    Text(title)
                }
                .frame(width: 100, height: 40)

                Text(message)
            }
            
            HStack(alignment: .top, spacing: 30) {
                ZStack {
                    Circle()
                        .fill(Color.purple)
                    Text(title)
                }
                .frame(width: 40, height: 40)

                Text(message)
            }
            
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(Color.cyan)
                    Text(title)
                }
                .frame(width: 40, height: 40)

                Text(message)
            }
            .padding([.horizontal]) //좌우
            
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(Color.brown)
                    Text(title)
                }
                .frame(width: 40, height: 40)

                Text(message)
            }
            .padding([.vertical]) //상하
            
        }
    }
}

#Preview {
    CircleView()
}
