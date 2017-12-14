//
//  MedicalRecordTableViewCell.swift
//  ExamWorks
//
//  Created by Saven Developer on 11/27/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class MedicalRecordTableViewCell: UITableViewCell,UITextFieldDelegate {
    var lbl_MedicalRecordTitle : UILabel!
    var lbl_MedicalRecordValue : UILabel!
    var border1 = CALayer()
    var border2 = CALayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lbl_MedicalRecordTitle =  UILabel(frame: CGRect(x:10,y:6,width:(UIScreen.main.bounds.size.width/2 - 10),height:32))
        lbl_MedicalRecordValue =  UILabel(frame: CGRect(x:(UIScreen.main.bounds.size.width/2 + 10),y:6,width:(UIScreen.main.bounds.size.width/2 - 10 - 10),height:32))
        lbl_MedicalRecordTitle.font = UIFont(name: "Roboto-Regular", size: 14.0)
        lbl_MedicalRecordValue.font = UIFont(name: "Roboto-Regular", size: 14.0)
        lbl_MedicalRecordTitle.textAlignment = NSTextAlignment.left
        lbl_MedicalRecordTitle.textColor = UIColor.gray
        lbl_MedicalRecordTitle.text = "Title"
        lbl_MedicalRecordTitle.backgroundColor = UIColor.clear
        lbl_MedicalRecordValue.textAlignment = .right
        lbl_MedicalRecordValue.textColor = UIColor.gray
        lbl_MedicalRecordValue.text = "Value"
        lbl_MedicalRecordValue.backgroundColor = UIColor.clear
        lbl_MedicalRecordTitle.numberOfLines = 0
        lbl_MedicalRecordTitle.lineBreakMode = .byWordWrapping
        
        self.addSubview(lbl_MedicalRecordTitle)
        self.addSubview(lbl_MedicalRecordValue)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
