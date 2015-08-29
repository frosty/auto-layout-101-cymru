//
//  PlaceDefinitionViewController.swift
//  Cymru
//
//  Created by James Frost on 28/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit
import MapKit

class PlaceDefinitionViewController: UIViewController {
  
  @IBOutlet weak var imageView: RoundedImageView!
  @IBOutlet weak var fullTextLabel: UILabel!
  @IBOutlet weak var button: UIButton!
  @IBOutlet weak var mapView: MKMapView!
  
  var place: Annotation?
  var snapshotter: MKMapSnapshotter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let options = MKMapSnapshotOptions()
    options.mapType = .Standard
    options.region = MKCoordinateRegionMakeWithDistance(place!.coordinate, 50_000, 50_000)
    mapView.region = options.region
    mapView.addAnnotation(place!)
    
    snapshotter = MKMapSnapshotter(options: options)
    snapshotter!.startWithCompletionHandler { (snapshot, error) -> Void in
//      self.imageView.image = snapshot!.image
    }
    if let place = place {
      title = place.title
      fullTextLabel.text = place.fullDescription
      imageView.image = place.image
    }
  }
}

extension PlaceDefinitionViewController: MKMapViewDelegate {
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    var view = mapView.dequeueReusableAnnotationViewWithIdentifier("Pin")
    if view == nil {
      view = MKPinAnnotationView(annotation: place, reuseIdentifier: "Pin")
    }
    
    return view
  }
}