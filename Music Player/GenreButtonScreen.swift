//
//  GentreButtonScreen.swift
//  Music Player
//
//  Created by Ellen Choi on 2019-02-17.
//  Copyright © 2019 Ellen Choi. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
    
    
}
