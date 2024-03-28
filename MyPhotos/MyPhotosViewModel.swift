//
//  MyPhotosViewModel.swift
//  MyPhotos
//
//  Created by Ronak Malick on 27/03/24.
//

import Foundation
import Combine

class MyPhotosViewModel: ObservableObject {
    
    private let service = APIService()
    
    @Published var photos: [Photo] = []
    @Published var error: NetworkError? = nil
    
    var cancallable = Set<AnyCancellable>()
    
    func fetchPhotos() {
        service.fetchPhotos(endpoint: "https://jsonplaceholder.typicode.com/photos") { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photos):
                    self.photos = photos
                    
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
}
