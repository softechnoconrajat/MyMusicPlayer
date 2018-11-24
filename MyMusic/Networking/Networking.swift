//
//  Networking.swift
//  MyMusic
//
//  Created by Rajat Kumar on 09/11/18.
//  Copyright © 2018 Rajat Kumar. All rights reserved.
//

import Foundation

class Networking {
    
    public func networkCall(url:URL, completion:@escaping (Data)->Void){
        
       // var dataToBeSent : Data?
      //  var error : Error
        let request = URLRequest.init(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, _, _) in
            guard let data = data else {return}
            
            completion(data)
    
        //do{
//            let json =  try JSONSerialization.jsonObject(with: data, options: [])
//            completion(json)
//            let musicDatas = try JSONDecoder().decode(MusicData.self, from: data)
//          //  print(musicDatas.resultCount)
//            for musicDetails in musicDatas.results{
//                 print(musicDetails.artistName)
//                 print(musicDetails.artworkUrl60)
//                 print(musicDetails.previewUrl)
//                 print(musicDetails.trackName)
//                
//            }
           
            
//        }
//        catch{
//            }
           
    }
    task.resume()
        
        
        
}
    
}


