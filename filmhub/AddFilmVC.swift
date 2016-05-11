//
//  AddFilmVC.swift
//  filmhub
//
//  Created by Javier Angel on 5/9/16.
//  Copyright © 2016 Iohta Group. All rights reserved.
//

import UIKit
import CoreData

class AddFilmVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var filmTitle: UITextField!
    @IBOutlet weak var filmDescription: UITextField!
    @IBOutlet weak var filmURl: UITextField!
    @IBOutlet weak var filmPlot: UITextField!
    @IBOutlet weak var filmImg: UIImageView!
    @IBOutlet weak var addFilm: UIButton!
    @IBOutlet weak var cancelAddition: UIButton!
    
    var imagePicker: UIImagePickerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        filmImg.clipsToBounds = true

    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        filmImg.image = image
    }
    
    @IBAction func addImg(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createFilm(sender: AnyObject!) {
        if let title = filmTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Film", inManagedObjectContext: context)!
            let film = Film(entity: entity, insertIntoManagedObjectContext: context)
            film.title = title
            film.plot = filmPlot.text
            film.url = filmURl.text
            film.movieDescription = filmDescription.text
            film.setFilmImg(filmImg.image!)
            
            context.insertObject(film)
            
            do {
                try context.save()
            } catch {
                print("Could not save film to core data")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func cancelFilmAddition(sender: AnyObject!) {
        self.navigationController?.popViewControllerAnimated(true)
    }



}
