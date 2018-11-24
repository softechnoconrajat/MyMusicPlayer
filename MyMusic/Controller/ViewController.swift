//
//  ViewController.swift
//  MyMusic
//
//  Created by Rajat Kumar on 29/10/18.
//  Copyright © 2018 Rajat Kumar. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    
    var musicResponseData : [Results]?

    @IBOutlet weak var serchTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Search playList function to check the availability of the data.
    @IBAction func searchPlayList(_ sender: Any) {
        var searchText : String?
        
        searchText = serchTextBox.text
        
        let trimmedsearchText = searchText!.replacingOccurrences(of: " ", with: "")
        
        if(searchText == ""){
            print("Enter Search String")
        }
        else{
            getMusicData(musicDetail : trimmedsearchText)
        }
    }
    
    func getMusicData(musicDetail : String){
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(musicDetail)")
        else { return }
        
        let networkCalling = Networking()
        networkCalling.networkCall(url: url){ (json:Data) in
            
            DispatchQueue.main.async {
                
                let jsonCalling = MusicAlbumDataParsing()
                jsonCalling.musicAlbumDataParsing(musicData: json, completion: { (musicResult, results) in
                    self.musicResponseData = results
                    if(musicResult == 0){
                        print("Please Enter The Correct Name")
                    }else{
                        self.performSegue(withIdentifier: "playListSegue", sender: self)
                    }
                })
            }//End of DispatchQueue.main.async
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playListSegue"{
            let destinationVC = segue.destination as! PlayListView
            destinationVC.musicDataDetails = musicResponseData
        }
    }
}

