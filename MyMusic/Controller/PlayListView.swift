//
//  PlayListView.swift
//  MyMusic
//
//  Created by Rajat Kumar on 30/10/18.
//  Copyright © 2018 Rajat Kumar. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import SDWebImage

class PlayListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var musicDataDetails : [Results]?
    let MusicPlayerMainobj = MusicPlayerMain()
    
    @IBOutlet weak var songListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //  print(musicDataDetails!)
        
        //Set YourSelf as datelgae and Datasource for the UITableView.
        songListTableView.delegate = self;
        songListTableView.dataSource = self;

        // Do any additional setup after loading the view.
        
        songListTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        configureTableView()
        

    }
    
    //declare cellForRowAtIndexPath here
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        

        
        if let musicDataDetails = musicDataDetails {
            cell.trackName.text = musicDataDetails[indexPath.row].trackName
            cell.artistName.text = musicDataDetails[indexPath.row].artistName
            cell.albumImage.sd_setImage(with: URL(string: musicDataDetails[indexPath.row].artworkUrl60), completed: nil)
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let musicDataDetails = musicDataDetails else {return 0}
        return musicDataDetails.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let musicDataDetails = musicDataDetails else {return}
        
        MusicPlayerMainobj.musicPlayer(songUrl: musicDataDetails[indexPath.row].previewUrl) { (controllerPlayer, controller) in
        
            present(controller, animated: true) {
                           controllerPlayer.play()
                       }
            
        }
      //  print(musicDataDetails[indexPath.row].previewUrl)
//         musicPlayerObj!.playVideo(songUrl: musicDataDetails[indexPath.row].previewUrl)
        
        
        //HardCoding
//        guard let url = URL(string: musicDataDetails[indexPath.row].previewUrl) else {
//            return
//        }
//        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
//        let player = AVPlayer(url: url)
//
//        // Create a new AVPlayerViewController and pass it a reference to the player.
//        let controller = AVPlayerViewController()
//        controller.player = player
//
//        // Modally present the player and call the player's play() method when complete.
//        present(controller, animated: true) {
//            player.play()
//        }
        
        
        
        
        
        
       //Harcoding Ends Here
        
        
        
    }
    
    
    func configureTableView(){
        songListTableView.rowHeight = 75.0
    }
    
}
