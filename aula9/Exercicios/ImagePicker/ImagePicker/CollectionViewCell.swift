//
//  CollectionViewCell.swift
//  ImagePicker
//
//  Created by InfraCWI on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "cell"
    
    @IBOutlet weak var img: UIImageView!
    
    
    override func awakeFromNib() {
        
    }
    
    func setImage(_ image: UIImage) {
        self.img.image = image
    }
}
