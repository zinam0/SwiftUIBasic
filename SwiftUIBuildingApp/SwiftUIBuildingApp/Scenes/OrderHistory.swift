//
//  OrderHistory.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/31/24.
//

import SwiftUI

struct OrderHistory: View {
    
    @EnvironmentObject var previousOrder: OrderStore
    
    var body: some View {
        NavigationStack {
            List {
                //List로는 제거 onDelete할 수 없음
                //List(previousOrder.orders) { order in
                ForEach(previousOrder.orders) { order in
                    NavigationLink(destination: OrderDetailView(order: order)) {
                        VStack(alignment: .leading) {
                            Text(order.itemName)
                                .font(.headline)
                            Text(order.date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteOrder)
            }
            .navigationTitle("Order History")
        }
    }
    private func deleteOrder(at offsets: IndexSet) {
        previousOrder.orders.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderHistory().environmentObject(OrderStore())
}
