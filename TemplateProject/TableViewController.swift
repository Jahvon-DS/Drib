//
//  TableViewController .swift
//  TemplateProject
//
//  Created by Jahvon on 8/11/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import Foundation
import Parse
import ParseUI
import UIKit
import CoreLocation

class TableViewController: PFQueryTableViewController, CLLocationManagerDelegate {
 
    let locationManager = CLLocationManager()
    var locationNow = CLLocationCoordinate2D()
    var footerView: UIView?
    var contentHeight: CGFloat = 0
    var comments: [String]?
    let FOOTERHEIGHT : CGFloat = 50;
    
    
    
    
    init (style: UITableViewStyle, classname: String!) {
        super.init(style: style, className: classname)
    }
    
    required init (coder aDecoder: NSCoder) {
    super.init (coder: aDecoder)
    //initalizing thee code 
        
    self.parseClassName = "Messenger"
        //The Class that needs to be quried
    self.textKey = "Message"
        //whats going to bbe displayed in the label of the cell
        self.imageKey = "image"
  self.pullToRefreshEnabled = true
        self.objectsPerPage = 100
    }

    private func alert(message: String!) {
        let alertControlletr = UIAlertController (title: nil, message: "Oops something  went wrong :/" , preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil )
      
}
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 100
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.rowHeight = 100
    }

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        alert("Can not determine location")
    }
    override func  queryForTable() -> PFQuery{
        
        let query = PFQuery(className: "Messenger")
//        let queryLoc = locationNow
//
//        query.whereKey("location", nearGeoPoint: PFGeoPoint(latitude: queryLoc.latitude, longitude: queryLoc.longitude), withinMiles: 100)
        query.limit = 100
        query.orderByDescending("createdAt")
        
        return query
        
       
    }
    
  
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locationManager.stopUpdatingLocation()
        if (locations.count > 0 ) {
            let location = locations[0] as! CLLocation
println(location.coordinate)
           locationNow = location.coordinate
        } else {
            alert ("Could not update locaation")
        
            
    }
        }
    override func objectAtIndexPath(indexPath: NSIndexPath!) -> PFObject? {
        var obj: PFObject? = nil
        if (indexPath.row < self.objects!.count) {
            obj = self.objects![indexPath.row] as? PFObject
            
    }
        return obj
}

    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject!) -> PFTableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("MessageCell", forIndexPath: indexPath) as! TableViewCell
        cell.textView.text = object.valueForKey("Message") as? String
        cell.textView.numberOfLines = 0
        let score = object.valueForKey("count") as! Int
          cell.count.text = "\(score)"        
        return cell
        
    }
    
    
    
    @IBAction func UpVote(sender: AnyObject) {

        let hitPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
        let hitIndex = self.tableView.indexPathForRowAtPoint(hitPoint)
        let object = objectAtIndexPath(hitIndex)
        object!.incrementKey("count")
        object!.saveInBackground()
        self.tableView.reloadData()
        NSLog("Top Index Path \(hitIndex?.row)")

    
    }
    

    
    
    @IBAction func DownVote(sender: AnyObject) {
            let hitPoint = sender.convertPoint(CGPointZero, toView: self.tableView)
        let hitIndex = self.tableView.indexPathForRowAtPoint(hitPoint)
        let object = objectAtIndexPath(hitIndex)
        object!.incrementKey("count", byAmount: -1)
        object!.saveInBackground()
        self.tableView.reloadData()
        NSLog("Top Index Path  \(hitIndex?.row)")

        
        
    }


}
