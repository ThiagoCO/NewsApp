//
//  TestView.swift
//  NewsApp
//
//  Created by Usertqi on 24/08/21.
//

import SwiftUI

struct TestView: View {
    
    typealias ErrorHandlerAction = () -> Void
    
    let error: Error
    let handler: ErrorHandlerAction
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
            Text("Ooopss")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .multilineTextAlignment(.center)
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 16, weight: .medium))
                .multilineTextAlignment(.center)
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 38)
            .background(Color.blue)
            .cornerRadius(10)
                
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(error: APIError.unknown) { }
            .previewLayout(.sizeThatFits)
    }
}
