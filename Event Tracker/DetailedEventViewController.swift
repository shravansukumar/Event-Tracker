//
//  DetailedEventViewController.swift
//  Event Tracker
//
//  Created by Shravan Sukumar on 03/07/16.
//  Copyright © 2016 shravan. All rights reserved.
//

import UIKit

class DetailedEventViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deatiledEvent: UILabel!
    @IBOutlet weak var eventType: UILabel!
    
    var eventDetails = ""
    var typeOfEvent = ""
    var myImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayingEventDetails()
        // Do any additional setup after loading the view.
    }
    
    
    //Method for displaying the outlets when view loads
    func displayingEventDetails() {
        deatiledEvent.text = eventDetails
        eventType.text = typeOfEvent
        imageView.image = myImage
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true     // status bar should be hidden
    }
    
    
    
   
    
    @IBAction func backButtonWhenPressed(sender: UIBarButtonItem) {
        //let backItem = UIBarButtonItem(title: "Custom", style: .Plain, target: nil, action: nil)
        //navigationItem.backBarButtonItem = backItem
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    

}


