//
//  ScrumView.swift
//  Tutorials
//
//  Created by 남지연 on 8/1/24.
//

import SwiftUI

struct ScrumView: View {
    
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
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
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumView(scrums: .constant(DailyScrum.sampleData))
    }
}

