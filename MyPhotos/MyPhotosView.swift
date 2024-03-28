//
//  ContentView.swift
//  MyPhotos
//
//  Created by Ronak Malick on 27/03/24.
//

import SwiftUI

struct MyPhotosView: View {
    @StateObject private var vm = MyPhotosViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
          
            if let error = vm.error {
                PhotoErrorView(error: error)
            } else {
                ZStack {
                    List {
                        
                        
                        
                        ForEach(vm.photos) { photo in
                            NavigationLink("") {
                                PhotoDetailView(urlString: photo.imageURL)
                            }
                            PhotoViewRow(photo: photo)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .navigationTitle("MyPhotos")
        .onAppear { vm.fetchPhotos() }
        .padding()
    }
}

#Preview {
    MyPhotosView()
}
