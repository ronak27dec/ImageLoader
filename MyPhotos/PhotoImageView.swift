//
//  PhotoImageView.swift
//  MyPhotos
//
//  Created by Ronak Malick on 28/03/24.
//

import SwiftUI

struct PhotoImageView: View {
    
    @StateObject var vm: PhotoImageViewModel
        
    init(imageURL: String) {
        _vm = StateObject(wrappedValue: PhotoImageViewModel(urlString: imageURL))
    }
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                ProgressView()
            } else if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
        .padding()
        .frame(maxWidth: 75, maxHeight: 75)
    }
}

#Preview {
    PhotoImageView(imageURL: "--")
}
