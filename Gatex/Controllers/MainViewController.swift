//
//  MainViewController.swift
//  Gatex
//
//  Created by Gustavo Kumasawa on 23/07/21.
//

import UIKit
import AVFoundation

class MainViewController: UINavigationController {
  private var audioPlayer: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let pathToSound = Bundle.main.path(forResource: "background", ofType: "mp3")!
    let url = URL(fileURLWithPath: pathToSound)
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.volume = 0.5
      audioPlayer?.numberOfLoops = -1
      audioPlayer?.play()
    } catch {
      print("problem with sound")
    }
  }
}

