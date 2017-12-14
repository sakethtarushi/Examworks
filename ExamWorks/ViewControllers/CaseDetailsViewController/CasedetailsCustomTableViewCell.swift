//
//  CasedetailsCustomTableViewCell.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/1/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class CasedetailsCustomTableViewCell: UITableViewCell {
   
    var label_Header : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        label_Header = UILabel(frame: CGRect(x:10,y:6,width:(UIScreen.main.bounds.size.width/2 - 10),height:32))
        label_Header.font = UIFont(name: "Roboto-Medium", size: 16.0)
        label_Header.textAlignment = NSTextAlignment.left
        label_Header.textColor = UIColor.gray
        label_Header.text = "Title"
        label_Header.backgroundColor = UIColor.clear
        self.addSubview(label_Header)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
