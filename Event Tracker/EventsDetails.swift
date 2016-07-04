//
//  EventsDetails.swift
//  Event Tracker
//
//  Created by Shravan Sukumar on 02/07/16.
//  Copyright © 2016 shravan. All rights reserved.
//

import Foundation
import UIKit

struct Events {
    let eventName: String
    let entryType: String
    let imageName: String
    
    static let EventKey = "NameKey"
    static let EntryTypeKey = "EntryType"
    static let ImageNameKey = "ImageNameKey"
    
    // Generate an event from a three entry dictionary

    
    init(dictionary:[String : String]) {
        self.eventName = dictionary[Events.EventKey]!
        self.entryType = dictionary[Events.EntryTypeKey]!
        self.imageName = dictionary[Events.ImageNameKey]!
    }
}

/**
 * This extension adds static variable allEvents. An array of Events objects
 */

extension Events {
    
    static var allEvents: [Events] {
        
        var eventsArray = [Events]()
        
        for d in Events.localEventsData(){
            eventsArray.append(Events(dictionary: d))
        }
        
        return eventsArray
    }
    
    static func localEventsData()-> [[String: String]] {
        
        return [
        
            [Events.EventKey:"Metallica Concert in Palace Grounds", Events.EntryTypeKey: "Paid Entry", Events.ImageNameKey:"Metallica"],
            [Events.EventKey:"Saree Exhibition in Malleswaram", Events.EntryTypeKey: "Free Entry", Events.ImageNameKey:"SareeExhibition"],
            [Events.EventKey:"Wine tasting event in Links Brewery", Events.EntryTypeKey: "Paid Entry", Events.ImageNameKey:"WineTasting"],
            [Events.EventKey:"Startups Meet in Kanteerava Stadium", Events.EntryTypeKey: "Paid Entry", Events.ImageNameKey:"StartupMeet"],
            [Events.EventKey:"Summer Noon Party in Kumara Park", Events.EntryTypeKey: "Paid Entry", Events.ImageNameKey:"SummerNoonParty"],
            [Events.EventKey:"Rock and Roll nights in Sarjapur Road", Events.EntryTypeKey: "Paid Entry", Events.ImageNameKey:"RockNRollNight"],
            [Events.EventKey:"Barbecue Fridays in Whitefield", Events.EntryTypeKey: "Paid Entry", Events.ImageNameKey:"BBQFriday"],
            [Events.EventKey:"Summer workshop in Indiranagar", Events.EntryTypeKey: "Free Entry", Events.ImageNameKey:"SummerWorkshop"],
            [Events.EventKey:"Impressions & Expressions in MG Road", Events.EntryTypeKey: "Free Entry", Events.ImageNameKey:"ImpressionAndExpression"],
            [Events.EventKey:"Italian carnival in Electronic City", Events.EntryTypeKey: "Free Entry", Events.ImageNameKey:"ItalianCarnival"]
        
        ]
    }
}
