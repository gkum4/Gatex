//
//  SituationViewController.swift
//  Gatex
//
//  Created by Gustavo Kumasawa on 23/07/21.
//

import UIKit
import AVFoundation

class SituationViewController: UIViewController {
  
  @IBOutlet weak var situationText: UITextView!
  
  @IBOutlet weak var option1: UIButton!
  @IBOutlet weak var option2: UIButton!
  @IBOutlet weak var option3: UIButton!
  
  @IBOutlet weak var optionDescription: UITextView!
  
  @IBOutlet weak var executeButton: UIButton!
  
  private var optionSelected = 1
  private var option1Description = ""
  private var option2Description = ""
  private var option3Description = ""
  
  private var audioPlayer: AVAudioPlayer?
  
  private func vetSituationCase(actualSituationData: SituationData) {
    if storyState.affection > storyState.anger {
      option1.isEnabled = false
      option1.alpha = 0
      
      optionSelected = 2
      
      highlightButton(selectedButton: option2)
      
      optionDescription.text = option2Description
      
      return
    }
    
    option2.isEnabled = false
    option2.alpha = 0
    
    optionSelected = 1
    
    highlightButton(selectedButton: option1)
    
    optionDescription.text = option1Description
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if optionSelected == 0 {
      executeButton.isEnabled = false
      executeButton.alpha = 0.5
    }
    
    var actualSituation = storyBaseSequence[storyState.step]
    
    if storyState.step == 3 && storyState.suspicion >= 2 {
      actualSituation = humanKnowsSituationData
    }
    
    situationText.text = actualSituation.situationText
    
    if actualSituation.option2Hidden {
      option2.isEnabled = false
      option2.alpha = 0
    }
    
    if actualSituation.option3Hidden {
      option3.isEnabled = false
      option3.alpha = 0
    }
    
    option1Description = actualSituation.option1Description
    option2Description = actualSituation.option2Description
    option3Description = actualSituation.option3Description
    
    if storyState.step == 3 && storyState.suspicion < 2 {
      vetSituationCase(actualSituationData: actualSituation)
      
      return
    }
    
    highlightButton(selectedButton: option1)
    
    optionDescription.text = option1Description
  }
  
  override func viewDidLayoutSubviews() {
    situationText.centerVertically()
  }
  
  private func highlightButton(selectedButton: UIButton) {
    selectedButton.backgroundColor = UIColor(named: "AccentColor")
    selectedButton.setTitleColor(.white, for: UIControl.State.normal)
    selectedButton.layer.cornerRadius = 40
    
    if selectedButton != option1 {
      unhighlightButton(button: option1)
    }
    
    if selectedButton != option2 {
      unhighlightButton(button: option2)
    }
    
    if selectedButton != option3 {
      unhighlightButton(button: option3)
    }
  }
  
  private func unhighlightButton(button: UIButton) {
    button.backgroundColor = .none
    button.setTitleColor(UIColor(named: "AccentColor"), for: UIControl.State.normal)
    button.layer.cornerRadius = 40
  }
  
  private func enableExecuteButton() {
    executeButton.isEnabled = true
    executeButton.alpha = 1
  }
  
  func playTouchSound() {
    let pathToSound = Bundle.main.path(forResource: "touch", ofType: "wav")!
    let url = URL(fileURLWithPath: pathToSound)
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.play()
    } catch {
      print("problem with touch sound")
    }
  }
  
  @IBAction func onClickOption1(_ sender: Any) {
    playTouchSound()
    optionSelected = 1
    optionDescription.text = option1Description
    highlightButton(selectedButton: option1)
    enableExecuteButton()
  }
  
  @IBAction func onClickOption2(_ sender: Any) {
    playTouchSound()
    optionSelected = 2
    optionDescription.text = option2Description
    highlightButton(selectedButton: option2)
    enableExecuteButton()
  }
  
  @IBAction func onClickOption3(_ sender: Any) {
    playTouchSound()
    optionSelected = 3
    optionDescription.text = option3Description
    highlightButton(selectedButton: option3)
    enableExecuteButton()
  }
  
  @IBAction func executeAction(_ sender: Any) {
    storyState.optionChosen = optionSelected
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let reactionViewController = storyBoard.instantiateViewController(withIdentifier: "reactionView") as! ReactionViewController
    reactionViewController.modalPresentationStyle = .fullScreen
    reactionViewController.modalTransitionStyle = .crossDissolve
    
    self.present(reactionViewController, animated: true, completion: nil)
  }
}

