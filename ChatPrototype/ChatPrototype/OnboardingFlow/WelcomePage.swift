//
//  WelcomePage.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.tint) //파란색
                   
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()
                    .border(.black, width: 1.5)
                
                Text("largeTitle")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.title)
                    .padding(.top)
                    .border(.black, width: 1.5)
                Text("title")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.title2)
                    .border(.black, width: 1.5)
                Text("title2")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.title3)
                    .border(.black, width: 1.5)
                Text("title3")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.headline)
                    .border(.black, width: 1.5)
                Text("headline")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.subheadline)
                    .border(.black, width: 1.5)
                Text("subheadline")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.body)
                    .border(.black, width: 1.5)
                Text("body")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.callout)
                    .border(.black, width: 1.5)
                Text("callout")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.footnote)
                    .border(.black, width: 1.5)
                Text("footnote")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.caption)
                    .border(.black, width: 1.5)
                Text("caption")
                    .foregroundStyle(.blue)
            }
            HStack {
                Text("Welcom to MyApp")
                    .font(.caption2)
                    .border(.black, width: 1.5)
                Text("caption2")
                    .foregroundStyle(.blue)
            }
        }
        .border(.orange, width:1.5)
        .padding()
        .border(.purple, width: 1.5)
        
    }
}

#Preview {
    WelcomePage()
}
