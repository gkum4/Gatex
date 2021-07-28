//
//  ReactionViewController.swift
//  Gatex
//
//  Created by Gustavo Kumasawa on 23/07/21.
//

import UIKit
import AVFoundation

class ReactionViewController: UIViewController {

  @IBOutlet weak var reactionText: UITextView!
  
  @IBOutlet weak var nextButton: UIButton!
  
  private var audioPlayer: AVAudioPlayer?
  
  private var isEnd = false
  
  private func getConsequenceEmoji(_ consequenceType: OptionConsequenceTypes) -> String {
    switch consequenceType {
    case .affection:
      return "😻"
    case .anger:
      return "😾"
    case .suspicion:
      return "🙀"
    case .end:
      return ""
    }
  }
  
  private func increaseStoryStateFeeling(_ consequenceType: OptionConsequenceTypes) {
    switch consequenceType {
    case .affection:
      storyState.affection += 1
    case .anger:
      storyState.anger += 1
    case .suspicion:
      storyState.suspicion += 1
    case .end:
      return
    }
  }
  
  private func checkIfIsEnd(_ consequenceType: OptionConsequenceTypes) -> Bool {
    if consequenceType == .end {
      return true
    }
    
    return false
  }
  
  private func playMeow(_ consequenceType: OptionConsequenceTypes) {
    let pathToSound: String
    
    switch consequenceType {
    case .affection:
      pathToSound = Bundle.main.path(forResource: "catPurrAndMeow", ofType: "wav")!
    case .anger:
      pathToSound = Bundle.main.path(forResource: "catScream", ofType: "wav")!
    case .suspicion:
      pathToSound = Bundle.main.path(forResource: "catSoftMeow", ofType: "wav")!
    case .end:
      return
    }
    
    let url = URL(fileURLWithPath: pathToSound)
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.play()
    } catch {
      print("problem with touch sound")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var actualSituation = storyBaseSequence[storyState.step]
    
    if storyState.step == 3 && storyState.suspicion >= 2 {
      actualSituation = humanKnowsSituationData
    }
    
    var consequenceText = ""
    var consequenceEmoji = ""
    
    switch storyState.optionChosen {
    case 1:
      isEnd = checkIfIsEnd(actualSituation.option1ConsequenceType)
      consequenceEmoji = getConsequenceEmoji(actualSituation.option1ConsequenceType)
      increaseStoryStateFeeling(actualSituation.option1ConsequenceType)
      playMeow(actualSituation.option1ConsequenceType)
      consequenceText = actualSituation.option1ConsequenceText
    
    case 2:
      isEnd = checkIfIsEnd(actualSituation.option2ConsequenceType)
      consequenceEmoji = getConsequenceEmoji(actualSituation.option2ConsequenceType)
      increaseStoryStateFeeling(actualSituation.option2ConsequenceType)
      playMeow(actualSituation.option2ConsequenceType)
      consequenceText = actualSituation.option2ConsequenceText
    
    case 3:
      isEnd = checkIfIsEnd(actualSituation.option3ConsequenceType)
      consequenceEmoji = getConsequenceEmoji(actualSituation.option3ConsequenceType)
      increaseStoryStateFeeling(actualSituation.option3ConsequenceType)
      playMeow(actualSituation.option3ConsequenceType)
      consequenceText = actualSituation.option3ConsequenceText
      
    default:
      consequenceText = ""
    }
    
    reactionText.text = consequenceText + (consequenceEmoji != "" ? "\n\n" + consequenceEmoji : "")
    
    if isEnd {
      nextButton.setTitle("Fim", for: UIControl.State.normal)
    }
  }
  
  override func viewDidLayoutSubviews() {
    reactionText.centerVertically()
  }
  
  private func end() {
    storyState = StoryState()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let situationViewController = storyBoard.instantiateViewController(withIdentifier: "situationView") as! SituationViewController
    situationViewController.modalPresentationStyle = .fullScreen
    situationViewController.modalTransitionStyle = .crossDissolve
    
    self.present(situationViewController, animated: true, completion: nil)
  }

  @IBAction func onClickNext(_ sender: Any) {
    if isEnd {
      end()
      return
    }
    
    storyState.step += 1
    storyState.optionChosen += 0
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    let situationViewController = storyBoard.instantiateViewController(withIdentifier: "situationView") as! SituationViewController
    situationViewController.modalPresentationStyle = .fullScreen
    situationViewController.modalTransitionStyle = .crossDissolve
    
    self.present(situationViewController, animated: true, completion: nil)
  }
}

