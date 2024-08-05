//
//  DetailEditView.swift
//  Tutorials
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI

struct DetailEditView: View {
    //해당 속성을 정의한 뷰 내에서만 접근이 가능해짐 - 정보가 변경될 수 있기 때문에 State 키워드가 사용됨
    @Binding var scrum:DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                ThemePicker(selection: $scrum.theme)
            } header: {
                Text("Meeting Info")
            }
            
            Section {
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }.onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)

                }
            } header: {
                Text("Attendees")
            }
            


        }
    }
}

#Preview {
    //constant - Binding을 생성하는데 사용되는 것으로 변화하지 않는 상수 값을 전달할 때 사용
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
