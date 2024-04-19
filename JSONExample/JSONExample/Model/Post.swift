//
//  Post.swift
//  JSONExample
//
//  Created by Janice on 4/19/24.
//

import Foundation

struct Post: Codable, Identifiable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String 
}
