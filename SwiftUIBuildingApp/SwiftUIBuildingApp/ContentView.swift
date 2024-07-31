//
//  ContentView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/30/24.
//

import SwiftUI

//ContentView는 뷰 빌더라고 알려진 특별한 종류의 클로저 내에서 선언
struct ContentView: View {
    
    @State private var order: Order = Order(includeSalt: false, includeRedPepperFlakes: false, quantity: 1)
                //protocol
    var body: some View {
        //VStack(alignment: .leading)
        //        init(
        //            alignment: HorizontalAlignment = .center,
        //            spacing: CGFloat? = nil,
        //            @ViewBuilder content: () -> Content
        //        )
        VStack {

            Text("Avocado Toast")
            //.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)⚠️ old
                .foregroundStyle(.green)
                .font(.title)
                .fontWeight(.bold)
            
            Text("🥑🍞 = 🥪")
                .backgroundStyle(.green)
                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .padding()
            
            Toggle(isOn: $order.includeSalt, label: {
                Text("Include Salt")
                
            }).padding(20)
            
            Toggle(isOn: $order.includeRedPepperFlakes, label: {
                Text("Include Red Pepper Flakes")
            }).padding(20)
            //$- 읽기 / 쓰기
            //다른 뷰에 바인딩을 전달
            Stepper(value: $order.quantity, in: 1...10) {
                Text("Quantity: \(order.quantity)")
            }.padding(20)
            
            Button(action: {
                
            }, label: {
                Text("Order")
            })
        }//.opacity(0.5) //각 object마다 불투명도 발생 각 오브젝트마다 설정하지 않아도됨
        
    }
}

#Preview {
    ContentView()
}
