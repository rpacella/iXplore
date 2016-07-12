//
//  JournalEntryController.swift
//  iXplore
//
//  Created by Riley Pacella on 7/11/16.
//  Copyright © 2016 RileyPacella. All rights reserved.
//

import Foundation
import MapKit

class JournalEntryController {
    static let sharedInstance = JournalEntryController()
    
    var entries: [JournalEntry] = {
        let entry1 = JournalEntry(title: "Entry 1", coordinate: CLLocationCoordinate2D(latitude: -34, longitude: 18.5), notes: "note 1", date: "Jan 1, 2016")
        let entry2 = JournalEntry(title: "Entry 2", coordinate: CLLocationCoordinate2D(latitude: -30, longitude: 25), notes: "notes", date: "Feb 20, 2016")
        let entry3 = JournalEntry(title: "Entry 3", coordinate: CLLocationCoordinate2D(latitude: 34, longitude: 18.5), notes: "notes", date: "March 6, 2016")
        let entry4 = JournalEntry(title: "Entry 4", coordinate: CLLocationCoordinate2D(latitude: 34, longitude: -18.5), notes: "notes hi", date: "April 11, 2014")
        let entry5 = JournalEntry(title: "Entry 5", coordinate: CLLocationCoordinate2D(latitude: -20, longitude: 18.5), notes: "hola", date: "Dec 29, 2030")
        let entry6 = JournalEntry(title: "Entry 6", coordinate: CLLocationCoordinate2D(latitude: -20, longitude: 12), notes: "knice", date: "Jan 19, 1997")
        return [entry1, entry2, entry3, entry4, entry5, entry6]
    }()
    
    func updatedJournalEntries(newEntry: JournalEntry) {
        entries.append(newEntry)
    }
}