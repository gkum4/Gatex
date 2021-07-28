//
//  YourDataViewController.swift
//  Gatex
//
//  Created by Gustavo Kumasawa on 24/07/21.
//

import UIKit

class YourDataViewController: UIViewController {

  @IBOutlet weak var leftText: UITextView!
  @IBOutlet weak var rightText: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    if traitCollection.userInterfaceStyle == .dark {
      leftText.textColor = .white
      rightText.textColor = .white
    } else {
      leftText.textColor = .black
      rightText.textColor = .black
    }
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    if traitCollection.userInterfaceStyle == .dark {
      leftText.textColor = .white
      rightText.textColor = .white
    } else {
      leftText.textColor = .black
      rightText.textColor = .black
    }
  }


}

