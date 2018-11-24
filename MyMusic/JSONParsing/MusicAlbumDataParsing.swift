//
//  MusicAlbumDataParsing.swift
//  MyMusic
//
//  Created by Rajat Kumar on 13/11/18.
//  Copyright © 2018 Rajat Kumar. All rights reserved.
//

import Foundation

class MusicAlbumDataParsing{
    
    func musicAlbumDataParsing(musicData:Data, completion: @escaping (Int, [Results])->Void){
        
        do{
            let musicDatas = try JSONDecoder().decode(MusicData.self, from: musicData)
            completion(musicDatas.resultCount, musicDatas.results)
        }
        catch{}
    }

}
