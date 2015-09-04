//
//  WordsDetailViewController.swift
//  Cymru
//
//  Created by James Frost on 29/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit

class WordsDetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var phraseLabel: UILabel!
  @IBOutlet weak var definitionLabel: UILabel!
  
  @IBOutlet weak var middleConstraint: NSLayoutConstraint!
  
  var definition: Definition?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let definition = definition {
      phraseLabel.text = definition.phrase
      imageView.image = definition.image
      definitionLabel.text = definition.definition
    }
  }
  
//  override func viewWillAppear(animated: Bool) {
//    super.viewWillAppear(animated)
//    
//    middleConstraint.constant = view.bounds.size.height
//    view.layoutIfNeeded()
//    
//    middleConstraint.constant = 40
//    UIView.animateWithDuration(2.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: { () -> Void in
//        self.view.layoutIfNeeded()
//      }, completion: nil)
//  }
  
  @IBAction func shareTapped() {}
  
  @IBAction func playTapped() {}
}
