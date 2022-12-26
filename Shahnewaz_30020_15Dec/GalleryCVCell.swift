//
//  GalleryCVCell.swift
//  Shahnewaz_30020_15Dec
//
//  Created by BJIT on 12/15/22.
//

import UIKit

class GalleryCVCell: UICollectionViewCell {
    
    
    @IBOutlet weak var galleryImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Create a UIView instance and set its frame
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        // Set the corner radius of the view to 10
        myView.layer.cornerRadius = 10

    }

}
