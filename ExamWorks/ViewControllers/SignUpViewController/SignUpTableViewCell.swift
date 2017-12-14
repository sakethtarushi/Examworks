//
//  SignUpTableViewCell.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 11/24/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class SignUpTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    var textfieldnumone : UITextField!
    var textfieldnumtwo : UITextField!
    var border1 = CALayer()
    var border2 = CALayer()
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        textfieldnumone =  UITextField(frame: CGRect(x: 10, y: 10, width: UIScreen.main.bounds.size.width/2-20, height: 49))
        textfieldnumtwo =  UITextField(frame: CGRect(x: (textfieldnumone.frame).maxX+20, y: 10, width: UIScreen.main.bounds.size.width/2-20, height: 49))
        
        // Adding Bottom Borders
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.lightGray.cgColor
        border1.frame = CGRect(x: 0, y: textfieldnumone.frame.size.height - width1, width:  textfieldnumone.frame.size.width, height: textfieldnumone.frame.size.height)
        
        border1.borderWidth = width1
        textfieldnumone.layer.addSublayer(border1)
        textfieldnumone.layer.masksToBounds = true
        
        let width2 = CGFloat(1.0)
        border2.borderColor = UIColor.lightGray.cgColor
        border2.frame = CGRect(x: 0, y: textfieldnumtwo.frame.size.height - width1, width:  textfieldnumtwo.frame.size.width, height: textfieldnumtwo.frame.size.height)
        
        border2.borderWidth = width2
        textfieldnumtwo.layer.addSublayer(border2)
        textfieldnumtwo.layer.masksToBounds = true
        
        textfieldnumone.delegate = self
        textfieldnumtwo.delegate = self
        textfieldnumone.font = UIFont(name: "Roboto-Medium", size: 16.0)
        textfieldnumtwo.font = UIFont(name: "Roboto-Medium", size: 16.0)

        self.addSubview(textfieldnumone)
        self.addSubview(textfieldnumtwo)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
