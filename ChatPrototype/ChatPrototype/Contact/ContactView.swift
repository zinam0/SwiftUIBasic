//
//  ContactView.swift
//  ChatPrototype
//
//  Created by Zizi on 8/7/24.
//

import SwiftUI

struct ContactView: View {
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    var body: some View {
        VStack {
            
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                //계층적인 렌더링 모드로, 심볼의 다양한 레이어를 다른 명암으로 렌더링하여 심볼에 깊이와 차원을 추가
                    .symbolRenderingMode(.hierarchical) //SF Symbols(Apple의 시스템 심볼 라이브러리)의 렌더링 모드를 설정
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled(true) // 텍스트 필드 자동 수정기능 비활성화
                .onSubmit { //return key 입력 제출할 때 실행되는 클로저
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName)
            
            Button {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        //사실상 return 입력하지 않아도 됨 (단일 표현식이라서)
                        names.removeAll { name in
                            return (name == randomName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    ContactView()
}
