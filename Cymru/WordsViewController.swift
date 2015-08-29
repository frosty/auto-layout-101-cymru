//
//  WordsViewController.swift
//  Cymru
//
//  Created by James Frost on 26/08/2015.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit

class WordsViewController: UITableViewController {

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let destinationVC = segue.destinationViewController as? WordsDetailViewController
      where segue.identifier == "DefineSegue" {
        if let indexPath = tableView.indexPathForSelectedRow {
          let definition = definitionsForSection(indexPath.section)[indexPath.row]
          destinationVC.definition = definition
        }
    }
  }
  
  func definitionsForSection(section: Int) -> [Definition] {
    switch section {
    case 0: return Definition.allPhrases
    case 1: return Definition.allWords
    default: return [Definition]()
    }
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return definitionsForSection(section).count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
    
    let definitions = definitionsForSection(indexPath.section)
    cell.textLabel!.text = definitions[indexPath.row].phrase
    cell.imageView?.image = definitions[indexPath.row].image
    
    return cell
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return (section == 0) ? "Phrases" : "Words"
  }
  
  override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let view = view as? UITableViewHeaderFooterView else {
      return
    }
    
    view.contentView.backgroundColor = welshRedColor
    view.textLabel?.textColor = UIColor.whiteColor()
  }
}

