//
//  ImagePreviewVC.swift
//  Shahnewaz_30020_15Dec
//
//  Created by BJIT on 12/22/22.
//

import UIKit

class ImagePreviewVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageName = ""
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: imageName)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func leftSwipeAction(_ sender: Any) {
        if (index != UserData.data.count - 1)
                {
                    index += 1
            UIView.transition(with: imageView, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.imageView.image = UIImage(named: UserData.data[self.index].name)
                    })
        
                }
    }
    

    
    @IBAction func rightSwipeAction(_ sender: Any) {
        if (index != 0)
                {
                    index -= 1
                    UIView.transition(with: imageView, duration: 1, options: .transitionCrossDissolve, animations: {
                        self.imageView.image = UIImage(named: UserData.data[self.index].name)
                    })
        
                }
    }

}
