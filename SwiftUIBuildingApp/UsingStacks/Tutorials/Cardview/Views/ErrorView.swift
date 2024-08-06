//
//  ErrorView.swift
//  Tutorials
//
//  Created by 남지연 on 8/6/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occured")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Dismiss"){
                        dismiss()
                    }
                }
            }
        }
    }
    
}

//#Preview {
struct ErrorWrapper_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error.")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
