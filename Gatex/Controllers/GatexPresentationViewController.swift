//
//  ViewController.swift
//  Gatex
//
//  Created by Gustavo Kumasawa on 20/07/21.
//

import UIKit
import AVFoundation

class GatexPresentationViewController: UIViewController {
  @IBOutlet weak var presentationText: UITextView!
  
  @IBOutlet weak var nextButton: UIButton!
  
  private var nextClicked = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidLayoutSubviews() {
    presentationText.centerVertically()
  }

  @IBAction func next(_ sender: Any) {
    if nextClicked {
      let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
      
      let situationViewController = storyBoard.instantiateViewController(withIdentifier: "situationView") as! SituationViewController
      situationViewController.modalPresentationStyle = .fullScreen
      situationViewController.modalTransitionStyle = .flipHorizontal
      
      self.present(situationViewController, animated: true, completion: nil)
      return
    }
    
    presentationText.text = """
      Os planos seguem os mesmos,
      por enquato só não crie suspeitas
      sobre nós, continue sendo o gatinho
      que eles acham que você é.
    """
    presentationText.centerVertically()
    
    nextButton.setTitle("Começar dia", for: UIControl.State.normal)
    
    nextClicked = true
  }
  
}

