//
//  CaseDetailsTableViewCell.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/1/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class CaseDetailsTableViewCell: UITableViewCell {

    var label_Tile : UILabel!
    var label_Value : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        label_Tile = UILabel(frame: CGRect(x:10,y:6,width:(UIScreen.main.bounds.size.width/2 - 10),height:32))
        label_Tile.font = UIFont(name: "Roboto-Regular", size: 13.0)
        label_Tile.textAlignment = NSTextAlignment.left
        label_Tile.textColor = UIColor.gray
        label_Tile.text = "Title"
        label_Tile.backgroundColor = UIColor.clear
        self.addSubview(label_Tile)
        
        label_Value = UILabel(frame: CGRect(x:(UIScreen.main.bounds.size.width/2 + 10),y:6,width:(UIScreen.main.bounds.size.width/2 - 10 - 10),height:32))
        label_Value.font = UIFont(name: "Roboto-Regular", size: 13.0)
        label_Value.textAlignment = NSTextAlignment.right
        label_Value.textColor = UIColor.black
        label_Value.text = "Value"
        label_Value.backgroundColor = UIColor.clear
        self.addSubview(label_Value)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
