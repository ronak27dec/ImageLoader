//
//  PhotoImageViewModel.swift
//  MyPhotos
//
//  Created by Ronak Malick on 28/03/24.
//

import Foundation
import SwiftUI

class PhotoImageViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = true
    
    var task: URLSessionDataTask?
    let cache = ImageCacheManager.shared
    
    init(urlString: String) {
        if let image = cache.get(key: urlString as NSString) {
            print("Image from Cache...")
            isLoading = false
            self.image = image
        } else {
            fetchThumbnailImage(urlString)
        }
        
    }

    
    func fetchThumbnailImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {return}

        self.image = nil
        if task == nil {
            task = URLSession.shared.dataTask(with: url) { data, response, error in
                print("Downloading image...")
                DispatchQueue.main.async {
                    self.isLoading = false
                    guard let data = data else {return}
                    guard let unwrappedImage = UIImage(data: data) else {return}
                    self.cache.add(key: urlString, value: unwrappedImage)
                    self.image = unwrappedImage
                }
            }
            task?.resume()
        } else {
            print("Cancelling task")
            task!.cancel()
        }
    }
    
}
