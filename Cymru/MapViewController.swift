//
//  SecondViewController.swift
//  Cymru
//
//  Created by James Frost on 26/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let center = CLLocation(latitude: 52.456009, longitude: -3.922119)
    let region = MKCoordinateRegionMakeWithDistance(center.coordinate, 250_000, 300_000)
    mapView.setRegion(region, animated: true)
    
    mapView.addAnnotations(Place.allPlaces())
  }
  
}

extension MapViewController: MKMapViewDelegate {
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    guard annotation is Place else {
      return nil
    }
    
    var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier("Pin") as? MKPinAnnotationView
    if pinView == nil {
      pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
      pinView!.canShowCallout = true
      pinView!.animatesDrop = true
    }
    
    pinView!.pinTintColor = UIColor(red:0.772, green:0.152, blue:0.153, alpha:1)
    pinView!.annotation = annotation
    
    return pinView
  }
}
