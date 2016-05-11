//
//  ViewController.swift
//  filmhub
//
//  Created by Javier Angel on 5/8/16.
//  Copyright © 2016 Iohta Group. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cellTableView: UITableView!
    
    var films = [Film]()
    
    var passedImage: UIImage!
    var passedTitle: String!
    var passedUrl: String!
    var passedDescription: String!
    var passedPlot: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellTableView.delegate = self
        cellTableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        cellTableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Film")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.films = results as! [Film]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("FilmCell") as? FilmCell {
            
            let film = films[indexPath.row]
            cell.configureCell(film)
            return cell
        } else {
            return FilmCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! FilmCell
        
        passedImage = currentCell.filmImage.image!
        passedTitle = currentCell.filmTitle.text!
        passedUrl = currentCell.filmUrl.text!
        passedDescription = currentCell.filmDescription.text!
        passedPlot = currentCell.filmPlot.text!
        
        performSegueWithIdentifier("DetailsSegue", sender: self)

        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailsSegue" {
            let destination = segue.destinationViewController as! FilmDetailsVC
            
                destination.receivedImg = passedImage
                destination.receivedTitle = passedTitle
                destination.receivedUrl = passedUrl
                destination.receivedDescription = passedDescription
                destination.receivedPlot = passedPlot
                
            
        }
    }
    

}

