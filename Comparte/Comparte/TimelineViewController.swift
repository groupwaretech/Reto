//
//  ViewController.swift
//  NavTransition
//
//  Created by Tope Abayomi on 21/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class TimelineViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var menuItem : UIBarButtonItem!
    @IBOutlet var toolbar : UIToolbar!
    
    var transitionOperator = TransitionOperator()
    
    struct Family {
        let name : String
        let image : String
        let imageS : String
    }
    
    var families = [Family]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100.0;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        menuItem.image = UIImage(named: "menu")
        toolbar.tintColor = UIColor.blackColor()
        
        
        self.families = [Family(name:"Familia Morales Yepes", image:"Familia-1", imageS:"Charity2")
            ,Family(name:"Familia Gómez Pérez", image:"Familia-2", imageS:"Charity2")
            ,Family(name:"Familia Carrillo Rodríguez", image:"Familia-3", imageS:"Charity")
            ,Family(name:"Familia Manzanera Bermudes", image:"Familia-4", imageS:"Charity")
            ,Family(name:"Familia Vélez Contreras", image:"Familia-5", imageS:"Charity")]
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TimelineCellPhoto") as TimelineCell
        let family = self.families[indexPath.row]
        
        cell.typeImageView.image = UIImage(named: family.imageS)
        cell.nameLabel.text = family.name
        cell.photoImageView?.image = UIImage(named: family.image)
        cell.dateLabel.text = "2 mins ago"
        
        return cell
        
    }
    
    @IBAction func presentNavigation(sender: AnyObject?){
        performSegueWithIdentifier("presentNav", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "presentNav") {
            let toViewController = segue.destinationViewController as UIViewController
            self.modalPresentationStyle = UIModalPresentationStyle.Custom
            toViewController.transitioningDelegate = self.transitionOperator
        } else {
            let toViewController = segue.destinationViewController as FamiliaViewController
            let indexPath = self.tableView.indexPathForSelectedRow()!
            let nameLabel = self.families[indexPath.row].name
            //toViewController.titleText.title = nameLabel;
            toViewController.index = indexPath.row
        }
        
    }
}






