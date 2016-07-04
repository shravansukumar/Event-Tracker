//
//  ViewController.swift
//  Event Tracker
//
//  Created by Shravan Sukumar on 30/06/16.
//  Copyright © 2016 shravan. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate,UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var nameForUser: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var gridView: UICollectionView!
    
    
    
    let allEvents = Events.allEvents
    var nextScreenRow: Events!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //Delegate method for clearnig the textField when pressed
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true     // status bar should be hidden
    }
    
    
    
    //Returning the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allEvents.count
    }
    
    //Displaying the table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("eventsCell")!
        let event = self.allEvents[indexPath.row]
        

        cell.textLabel?.text = event.eventName
        cell.imageView?.image = UIImage(named: event.imageName)
        cell.detailTextLabel?.text = event.entryType
        
        return cell
    }
    
   //Method executed when a 'row' is selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    //Return the no of rows in collection view
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allEvents.count
    }
    
    //Display the collection view
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let sec = collectionView.dequeueReusableCellWithReuseIdentifier("eventsSec", forIndexPath: indexPath) as! GridCollectionViewCell
        
        let event = self.allEvents[indexPath.row]
        
        
         sec.imageView.image = UIImage(named: event.imageName)
         sec.caption.text = event.entryType
        
        return sec
    }
    
    //Changing to a different ViewController, using 'segue id'
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if (segue.identifier == "successfulLogin"){
            segue.destinationViewController as! TabController
        }
        
        else if (segue.identifier == "tryToConnect"){
                let selectedIndex = self.tableView.indexPathForCell(sender as! UITableViewCell)
                nextScreenRow     = allEvents[selectedIndex!.row]
                let view          = segue.destinationViewController as! DetailedEventViewController
                
                view.eventDetails = nextScreenRow.eventName
                view.typeOfEvent  = nextScreenRow.entryType
                view.myImage      = UIImage(named: nextScreenRow.imageName)
        
        
        }
            else if(segue.identifier == "tryToConnect2"){
                let selectedIndex = self.gridView.indexPathForCell(sender as! UICollectionViewCell)
                nextScreenRow = allEvents[selectedIndex!.row]
                let view = segue.destinationViewController as! DetailedEventViewController
                
                view.eventDetails = nextScreenRow.eventName
                view.typeOfEvent  = nextScreenRow.entryType
                view.myImage      = UIImage(named: nextScreenRow.imageName)
        }
                
                
    }
    
    
    //When 'login' button is pressed
    @IBAction func loginButtonWhenPressed(sender: UIButton) {
        let userName = nameForUser.text

        if userName == "" {
            let nextController = UIAlertController()
            nextController.title = "Error!"
            nextController.message = "Please enter a name"
            
            let okAction = UIAlertAction(title: "okay", style: UIAlertActionStyle.Default) {
                action in self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            nextController.addAction(okAction)
            self.presentViewController(nextController, animated: true, completion: nil)
        }
    }
    
    

}

