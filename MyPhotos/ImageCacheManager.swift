//
//  ImageCacheManager.swift
//  MyPhotos
//
//  Created by Ronak Malick on 28/03/24.
//

import Foundation
import SwiftUI

class ImageCacheManager 
{
    
    static let shared = ImageCacheManager()
    
    var cache: NSCache<NSString, UIImage> = 
    {
        var tempCache = NSCache<NSString, UIImage>()
        tempCache.countLimit = 200
        tempCache.totalCostLimit = 200 * 1024 * 1024
        return tempCache
    }()
    
    private init() {}
    
    func add(key: String, value: UIImage) 
    {
        cache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: NSString) -> UIImage? 
    {
        cache.object(forKey: key)
    }
}
