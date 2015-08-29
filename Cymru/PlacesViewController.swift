//
//  PlacesViewController.swift
//  Cymru
//
//  Created by James Frost on 27/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit

let tableView = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("PlacesTableViewController")

class PlacesTableViewCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var iconView: UIImageView!
  
  var place: Annotation? {
    didSet {
      if let place = place {
        titleLabel.text = place.title
        descriptionLabel.text = place.summary
        iconView.image = place.image
      }
    }
  }
}

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var mapContainerView: UIView!
    @IBOutlet weak var tableContainerView: UIView!
    
    @IBAction func switchButtonTapped(sender: AnyObject) {
        navigationController?.viewControllers = [ tableView ]
    }
}

class PlacesTableViewController: UITableViewController {
  
  let annotations = Annotation.allAnnotations()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = 70
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let destinationVC = segue.destinationViewController as? PlaceDefinitionViewController
      where segue.identifier == "PlaceDetailSegue" {
        let annotation = annotations[tableView.indexPathForSelectedRow!.row]
        destinationVC.place = annotation
    }
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return annotations.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PlaceCell", forIndexPath: indexPath) as! PlacesTableViewCell
    
    let annotation = annotations[indexPath.row]
    cell.place = annotation
    
    return cell
  }
}
