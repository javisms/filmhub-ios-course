//
//  FilmCell.swift
//  filmhub
//
//  Created by Javier Angel on 5/9/16.
//  Copyright © 2016 Iohta Group. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {
    
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmUrl: UILabel!
    @IBOutlet weak var filmDescription: UILabel!
    @IBOutlet weak var filmPlot: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        filmImage.clipsToBounds = true
        filmImage.layer.cornerRadius = 5.0
        
    }
    
    func configureCell(film: Film) {
        filmTitle.text = film.title
        filmUrl.text = film.url
        filmDescription.text = film.movieDescription
        filmImage.image = film.getFilmImg()
        filmPlot.text = film.plot
    }
    
    
    


}
