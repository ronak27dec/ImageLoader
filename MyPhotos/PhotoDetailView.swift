//
//  PhotoDetailView.swift
//  MyPhotos
//
//  Created by Ronak Malick on 29/03/24.
//

import SwiftUI

struct PhotoDetailView: View {
    private let urlString: String
    
    @StateObject var vm: PhotoImageViewModel
    
    init(urlString: String) {
        self.urlString = urlString
        _vm = StateObject(wrappedValue: PhotoImageViewModel(urlString: urlString))
    }
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .renderingMode(.original)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()
    }
}

#Preview {
    PhotoDetailView(urlString: "")
}
