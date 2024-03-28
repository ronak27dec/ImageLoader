//
//  Photo.swift
//  MyPhotos
//
//  Created by Ronak Malick on 27/03/24.
//

import Foundation

struct Photo: Codable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let imageURL: String
    let thumbnailURL: String
    
    private enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case imageURL = "url"
        case thumbnailURL = "thumbnailUrl"
    }
}
