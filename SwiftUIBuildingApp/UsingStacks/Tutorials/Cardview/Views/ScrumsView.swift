//
//  ScrumView.swift
//  Tutorials
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void
    
    var body: some View {
        
        //리스트로만 나열 (테이블뷰)
        NavigationStack {
            List($scrums) { $scrum in
                //guard x 조기종료되어서 안보여지게됨
                //조건에 따라서 뷰를 포함하거나 제외하려면 if문 사용
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
            .toolbar(content: {
                Button(action:{
                    isPresentingNewScrumView = true
                }){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            })
            .sheet(isPresented: $isPresentingNewScrumView, content: {
                NewScrumSheet(scrums: $scrums, isPresentingScrumView: $isPresentingNewScrumView)
            })
            //장면 비활성화되면 백그라운드 이동하기 전에 데이터 저장 등의 작업 수행
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}

