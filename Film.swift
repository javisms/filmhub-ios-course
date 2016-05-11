//
//  Film.swift
//  filmhub
//
//  Created by Javier Angel on 5/9/16.
//  Copyright © 2016 Iohta Group. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Film: NSManagedObject {
    
    func setFilmImg(image: UIImage) {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getFilmImg() -> UIImage {
        let image = UIImage(data: self.image!)!
        return image
    }


}
