//
//  AppDelegate.swift
//  Cymru
//
//  Created by James Frost on 26/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit

let welshRedColor = UIColor(red:0.85, green:0.062, blue:0.125, alpha:1)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window!.tintColor = welshRedColor
    
    return true
  }
}
