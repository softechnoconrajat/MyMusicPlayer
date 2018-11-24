//
//  MusicData.swift
//  MyMusic
//
//  Created by Rajat Kumar on 09/11/18.
//  Copyright © 2018 Rajat Kumar. All rights reserved.
//

import Foundation

struct MusicData: Decodable {
    
    var resultCount: Int
    var results: [Results]
    
}

struct Results : Decodable {
    
    var previewUrl : String
    var artistName : String
    var artworkUrl60 : String
    var trackName : String

}
