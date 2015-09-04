//
//  PlacesDetailViewController.swift
//  Cymru
//
//  Created by James Frost on 28/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit
import MapKit

class PlacesDetailViewController: UIViewController {

  let pinIdentifier = "Pin"

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var fullTextLabel: UILabel!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var mapView: MKMapView!
  
  var place: Place?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.region = MKCoordinateRegionMakeWithDistance(place!.coordinate, 50_000, 50_000)
    mapView.addAnnotation(place!)
    mapView.userInteractionEnabled = false
    
    if let place = place {
      title = place.title
      fullTextLabel.text = place.fullDescription
      imageView.image = place.image
    }
  }
}

extension PlacesDetailViewController: MKMapViewDelegate {
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    var view = mapView.dequeueReusableAnnotationViewWithIdentifier(pinIdentifier) as? MKPinAnnotationView
    if view == nil {
      view = MKPinAnnotationView(annotation: place, reuseIdentifier: pinIdentifier)
      view?.pinTintColor = welshRedColor
    }
    
    return view
  }
}