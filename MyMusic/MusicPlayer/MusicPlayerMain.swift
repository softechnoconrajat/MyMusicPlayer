//
//  ViewController.swift
//  MyMusic
//
//  Created by Rajat Kumar on 16/11/18.
//  Copyright © 2018 Rajat Kumar. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class MusicPlayerMain: UIViewController {

    func musicPlayer(songUrl:String, completion: (AVPlayer, AVPlayerViewController)-> Void){
        
        guard let url = URL(string: songUrl) else {
            return
        }
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)
        
        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player
        
        completion(player, controller)
        
        // Modally present the player and call the player's play() method when complete.
//        present(controller, animated: true) {
//            player.play()
//        }
        
       
        
        
        
        
    }
}
