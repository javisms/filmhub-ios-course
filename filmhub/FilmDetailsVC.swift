//
//  FilmDetailsVC.swift
//  filmhub
//
//  Created by Javier Angel on 5/9/16.
//  Copyright © 2016 Iohta Group. All rights reserved.
//

import UIKit
import CoreData

class FilmDetailsVC: UIViewController {
    
    @IBOutlet weak var filmImg: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var filmURl: UILabel!
    @IBOutlet weak var filmPlot: UILabel!
    
    var receivedImg: UIImage!
    var receivedTitle: String!
    var receivedDescription: String!
    var receivedUrl: String!
    var receivedPlot: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmImg.clipsToBounds = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        filmImg.image = receivedImg
        filmTitle.text = receivedTitle
        filmDescription.text = receivedDescription
        filmURl.text = receivedUrl
        filmPlot.text = receivedPlot
    }
    

    
    
}
