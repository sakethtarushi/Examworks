//
//  SurvellianceCollectionViewCell.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/13/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class SurvellianceCollectionViewCell: UICollectionViewCell {

    var imageview_Survelliance : UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageview_Survelliance = UIImageView(frame: CGRect(x:5,y:0,width:UIScreen.main.bounds.size.width/2-10,height:160))
        imageview_Survelliance.contentMode = .scaleAspectFill
        self.addSubview(imageview_Survelliance)
        
        
    }

}
