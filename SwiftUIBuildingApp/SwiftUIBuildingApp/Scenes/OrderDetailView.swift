//
//  OrderDetailView.swift
//  SwiftUIBuildingApp
//
//  Created by 남지연 on 7/31/24.
//

import SwiftUI

struct OrderDetailView: View {
    var order: Order
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                Text(order.itemName)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(order.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Divider()
                
                Text("Details")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                HStack {
                    Text("Quantity:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(order.quantity)")
                }
                
                HStack {
                    Text("Bread:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(order.bread.rawValue)
                }
                
                HStack {
                    Text("Spread:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(order.spread.rawValue)
                }
                
                HStack {
                    Text("Avocado:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(order.avocado.rawValue)
                }
            }
            
            Group {
                Divider()
                
                Text("Extras")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                HStack {
                    Text("Include Salt:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(order.includeSalt ? "Yes" : "No")
                }
                
                HStack {
                    Text("Include Red Pepper Flakes:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(order.includeRedPepperFlakes ? "Yes" : "No")
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Order Details")
    }
}

#Preview {
    OrderDetailView(order: SampleData.sampleOrder)
}


struct SampleData {
    static let sampleOrder = Order(
        itemName: "Avocado Toast",
        date: Date(),
        bread: .white,
        spread: .none,
        avocado: .slice,
        includeSalt: true,
        includeRedPepperFlakes: false,
        quantity: 2
    )
}
