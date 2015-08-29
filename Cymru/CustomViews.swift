//
//  CustomViews.swift
//  Cymru
//
//  Created by James Frost on 29/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    layer.cornerRadius = 4.0
  }
  
  override func intrinsicContentSize() -> CGSize {
    return CGSize(width: UIViewNoIntrinsicMetric, height: 44.0)
  }
}

@IBDesignable
class RoundedImageView: UIImageView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    commonInit()
  }
  
  @IBInspectable var borderWidth: CGFloat = 2.0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  private func commonInit() {
    clipsToBounds = true
    layer.borderColor = welshRedColor.CGColor
  }
  
  override func intrinsicContentSize() -> CGSize {
    return CGSize(width: 40.0, height: 40.0)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    layer.cornerRadius = CGRectGetWidth(bounds) / 2
  }
}
