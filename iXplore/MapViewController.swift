//
//  MapViewController.swift
//  iXplore
//
//  Created by Riley Pacella on 7/11/16.
//  Copyright © 2016 RileyPacella. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        mapView.showsUserLocation = true

    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
         mapView.addAnnotations(JournalEntryController.sharedInstance.entries)

    }
    
   
    
    @IBAction func newEntryButtonPressed(sender: AnyObject) {
        
        let newEntryViewController = NewEntryViewController(nibName: "NewEntry", bundle: nil)
        self.presentViewController(newEntryViewController, animated: true, completion: nil)

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JournalEntryController.sharedInstance.entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let entries = JournalEntryController.sharedInstance.entries
        cell.textLabel?.text = entries[indexPath.row].title
        print(JournalEntryController.sharedInstance.entries.count)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let span = MKCoordinateSpanMake(0.05,0.05)
        let entryArray = JournalEntryController.sharedInstance.entries
        let region = MKCoordinateRegion(center: entryArray[indexPath.row].coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
}

}
