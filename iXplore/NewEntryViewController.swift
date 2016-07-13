//
//  NewEntryViewController.swift
//  iXplore
//
//  Created by Riley Pacella on 7/12/16.
//  Copyright © 2016 RileyPacella. All rights reserved.
//

import UIKit
import MapKit

class NewEntryViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()

    // IBOutlets
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var notesField: UITextField!
    
    @IBOutlet weak var latField: UITextField!
    
    @IBOutlet weak var longField: UITextField!
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        
        //Error alert for unauthorized : deeplink to settings
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Denied {
            let errorMessage : String = "Please change location settings in Settings"
            let errorAlert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
            let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in })
            let settingsErrorAlert = UIAlertAction(title: "Settings", style: .Default, handler: { action in UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
            })
            errorAlert.addAction(dismissErrorAlert)
            errorAlert.addAction(settingsErrorAlert)
            
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
        

    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {

        let location = newLocation as CLLocation
        latField.text = String(location.coordinate.latitude)
        longField.text = String(location.coordinate.longitude)
        
        locationManager.stopUpdatingLocation()
    }

    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        if latField.text == "" || longField.text == "" || titleField.text == "" {
            let errorMessage : String = "Please fill in all required fields"
            let errorAlert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
            let dismissErrorAlert = UIAlertAction(title: "Dismiss", style: .Default, handler: { (action) in })
            errorAlert.addAction(dismissErrorAlert)
            self.presentViewController(errorAlert, animated: true, completion: nil)
        }
        else {
        let coordinate = CLLocationCoordinate2D(latitude: Double(latField.text!)!, longitude: Double(longField.text!)!)
        let newEntry = JournalEntry(title: titleField.text!, coordinate: coordinate, notes: notesField.text!, date: "")
        JournalEntryController.sharedInstance.updatedJournalEntries(newEntry)
        self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
