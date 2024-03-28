//
//  PhotoViewRow.swift
//  MyPhotos
//
//  Created by Ronak Malick on 28/03/24.
//

import SwiftUI

struct PhotoViewRow: View {
    
    let photo: Photo
    
    var body: some View {
        HStack {
            PhotoImageView(imageURL: photo.thumbnailURL)
            
            VStack(alignment: .leading) {
                Text(photo.title)
                    .font(.headline)
                    .fontWidth(.compressed)
                Text(photo.imageURL)
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.gray)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    PhotoViewRow(photo: Photo(albumId: 1,
                              id: 1,
                              title: "Title",
                              imageURL: "image URL",
                              thumbnailURL: "Thumbnail URL"))
    .padding()
    .previewLayout(.sizeThatFits)
}
