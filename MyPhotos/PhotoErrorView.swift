//
//  PhotoErrorView.swift
//  MyPhotos
//
//  Created by Ronak Malick on 28/03/24.
//

import SwiftUI

struct PhotoErrorView: View {
    private let error: NetworkError
    
    init(error: NetworkError) {
        self.error = error
    }
    
    var body: some View {
        VStack {
            Text("You encountered an error!")
        }
    }
}

#Preview {
    PhotoErrorView(error: .badRequest)
}
