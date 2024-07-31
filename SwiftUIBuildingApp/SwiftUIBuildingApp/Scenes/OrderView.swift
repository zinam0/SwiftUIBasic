//
//  OrderView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/31/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var orderStore: OrderStore
    @State private var order = Order(
        itemName: "Avocado Toast",
        date: Date(),
        bread: .white,
        spread: .none,
        avocado: .slice,
        includeSalt: false,
        includeRedPepperFlakes: false,
        quantity: 1
    )
    @State private var showAlert = false
    //protocol
    var body: some View {
        //VStack(alignment: .leading)
        //        init(
        //            alignment: HorizontalAlignment = .center,
        //            spacing: CGFloat? = nil,
        //            @ViewBuilder content: () -> Content
        //        )
        Form {
            Section {
                Group {
                    //Bread
                    Picker(selection: $order.bread) {
                        ForEach(BreadType.allCases) { bread in
                            Text(bread.rawValue).tag(bread)
                        }
                    } label: {
                        Text("Bread")
                    }
                    //iOS에서는 사용 불가능함 - macOS 사용가능
                    //.pickerStyle(.radioGroup)
                    
                    //Spread
                    Picker(selection: $order.spread) {
                        ForEach(SpreadType.allCases) { spread in
                            Text(spread.rawValue).tag(spread)
                        }
                    } label: {
                        Text("Spread")
                    }
                    
                    
                    //Avocado
                    Picker(selection: $order.avocado) {
                        ForEach(AvocadoType.allCases) { avocado in
                            Text(avocado.rawValue).tag(avocado)
                        }
                    } label: {
                        Text("Avocado")
                    }
                    
                }.pickerStyle(.menu)
                //.pickerStyle(.wheel)
            } header: {
                VStack(alignment: .leading) {
                    Text("Avocado Toast")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    Text("🥑🍞 = 🥪")
                        .foregroundStyle(.primary)
                }
            }
            
            Section {
                Group {
                    
                    //Salt
                    Toggle(isOn: $order.includeSalt, label: {
                        Text("Include Salt")
                        
                    })
                    
                    //ReadPepper
                    Toggle(isOn: $order.includeRedPepperFlakes, label: {
                        Text("Include Red Pepper Flakes")
                    })
                    //$- 읽기 / 쓰기
                    //다른 뷰에 바인딩을 전달
                    Stepper(value: $order.quantity, in: 1...10) {
                        Text("Quantity: \(order.quantity)")
                    }
                }//.padding()
            }
            
            Section() {
                //Button - Struct
                //                init(
                //                    action: @escaping () -> Void,
                //                    @ViewBuilder label: () -> Label
                //                )
                Button(action: {
                    orderStore.addOrder(
                        itemName: order.itemName,
                        date: order.date,
                        bread: order.bread,
                        spread: order.spread,
                        avocado: order.avocado,
                        includeSalt: order.includeSalt,
                        includeRedPepperFlakes: order.includeRedPepperFlakes,
                        quantity: order.quantity
                    )
                    showAlert = true
                }, label: {
                    VStack(alignment: .center) {
                        Text("🥪")
                        Text("Order")
                    }
                    .frame(maxWidth: .infinity)
                }).disabled(order.quantity == 0)
                    .alert(isPresented: $showAlert, content: {
                        customAlert(title: "Order complete", message: "Your order of \(order.itemName), \(order.quantity)")
                    })
            }
        }//.opacity(0.5) //각 object마다 불투명도 발생 각 오브젝트마다 설정하지 않아도됨
        
    }
}


#Preview {
    OrderView()
        .environmentObject(OrderStore())
}
