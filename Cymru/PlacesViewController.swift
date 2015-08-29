//
//  PlacesViewController.swift
//  Cymru
//
//  Created by James Frost on 27/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit

class PlacesViewController: UITableViewController {
  
  let places = Place.allPlaces()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    tableView.estimatedRowHeight = 70
//    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let destinationVC = segue.destinationViewController as? PlacesDetailViewController
      where segue.identifier == "PlaceDetailSegue" {
        let place = places[tableView.indexPathForSelectedRow!.row]
        destinationVC.place = place
    }
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return places.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("PlaceCell", forIndexPath: indexPath)
    
    let place = places[indexPath.row]

    cell.textLabel?.text = place.title
    cell.detailTextLabel?.text = place.summary
    cell.imageView?.image = place.image
    
    return cell
  }
}


class PlacesTableViewCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var photoView: UIImageView!
  
  var place: Place? {
    didSet {
      if let place = place {
        titleLabel.text = place.title
        descriptionLabel.text = place.summary
        photoView.image = place.image
      }
    }
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    descriptionLabel.text = nil
    photoView.image = nil
  }
}
