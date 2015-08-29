//
//  Models.swift
//  Cymru
//
//  Created by James Frost on 29/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct Definition {
  let phrase: String
  let definition: String
  var image: UIImage? = nil
  
  init(phrase: String, definition: String, imageName: String? = nil) {
    self.phrase = phrase
    self.definition = definition
    if let imageName = imageName {
      image = UIImage(named: imageName)
    }
  }
  
  static var _allPhrases: [Definition]!
  static var allPhrases: [Definition] {
    if (_allPhrases == nil) {
      _allPhrases = [ Definition(phrase: "Who's coat's this jacket?", definition: "To whom does this coat belong?", imageName: "Jacket.png"),
        Definition(phrase: "Where to are you now then?", definition: "Where are you?", imageName: "Location.png"),
        Definition(phrase: "Now in a minute", definition: "Some vague time in the near future.", imageName: "Alarm Clock.png"),
        Definition(phrase: "Tidy", definition: "Great!", imageName: "Broom.png"),
        Definition(phrase: "Lush", definition: "Oh, well that is just magnificent.", imageName: "In Love.png")]
    }
    
    return _allPhrases
  }
  
  static var _allWords: [Definition]!
  static var allWords: [Definition] {
    if (_allWords == nil) {
      _allWords = [ Definition(phrase: "Popty-ping", definition: "Microwave", imageName: "Microwave.png"),
        Definition(phrase: "Bwrdd smwddio", definition: "Ironing board", imageName: "Iron.png"),
        Definition(phrase: "Cwtch", definition: "A lovely cuddle", imageName: "Novel.png"),
        Definition(phrase: "Butt", definition: "A good friend.", imageName: "Bottom.png"),
        Definition(phrase: "Tacsi", definition: "Taxi", imageName: "Taxi.png"),
        Definition(phrase: "Bws", definition: "Bus", imageName: "Bus.png"),
        Definition(phrase: "Ambwilans", definition: "Ambulance", imageName: "Ambulance.png"),
        Definition(phrase: "Moron", definition: "Carrot", imageName: "Carrot.png"),
        Definition(phrase: "Allan", definition: "Exit", imageName: "Exit Sign.png")
      ]
    }
    
    return _allWords
  }
}

@objc
class Place: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D
  
  var title: String?
  var summary: String?
  var fullDescription: String?
  var image: UIImage?
  
  init(coordinate: CLLocationCoordinate2D, title: String?, summary: String? = nil, fullDescription: String? = nil, imageName: String? = nil) {
    self.coordinate = coordinate
    self.title = title
    self.summary = summary
    self.fullDescription = fullDescription
    
    if let imageName = imageName {
      self.image = UIImage(named: imageName, inBundle: NSBundle(forClass: self.dynamicType), compatibleWithTraitCollection: nil)
    }
  }
  
  class func allPlaces() -> [Place] {
    return [ Place(coordinate: CLLocationCoordinate2D(latitude: 53.224622, longitude: -4.197995), title: "Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch", summary: "The longest place name in Britain!", fullDescription: "Llanfair PG or Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch is a village on the island of Anglesey in Wales, Britain. It is in the Guinness Book of Records for being the place with the longest name in Britain.\n\nThe name means \"St Mary's church in the hollow of the white hazel near to the fierce whirlpool and the church of St Tysilio of the red cave\" in Welsh. It was invented in the 1860s by a local tailor to make the village famous for having the railway station with the longest name.\n\nEnglish speakers (pronounce ch as in \"Loch-Ness\") saying \"Thlan-vire-poothl-gwin-githl-go-ger-i-chwen-drob-oothl-landus-ilio-goh-goh-goch\" will sound close to how it is meant to sound although the double L sound is difficult to recreate.", imageName: "llan.jpg"),
             Place(coordinate: CLLocationCoordinate2D(latitude: 52.415303, longitude: -4.08292), title: "Aberystwyth", summary: "Ah, beautiful Aberystwyth!", fullDescription: "For one week every year, the town is overrun with packs of marauding iOS developers. The most inaccessible location in the whole of the British Isles.", imageName: "aber.jpg"),
             Place(coordinate: CLLocationCoordinate2D(latitude: 51.481581, longitude: -3.17909), title: "Cardiff", summary: "The King of Wales lives here, in Cardiff Castle!", fullDescription: "Cardiff is the capital and biggest city of Wales, in the United Kingdom.", imageName: "cardiff.jpg")
    ]
  }
}
