//
//  CaseListTableViewCell.swift
//  ExamWorks
//
//  Created by Saven Developer on 12/6/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class CaseListTableViewCell: UITableViewCell {
    var label_ValCaseno : UILabel!
    var label_ValClaimno : UILabel!
    var label_ValExaminee : UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        label_ValCaseno = UILabel(frame: CGRect(x:3,y:0,width:UIScreen.main.bounds.size.width/3-3,height:40))
        label_ValCaseno.font = UIFont(name: "Roboto-Regular", size: 14.0)
        label_ValCaseno.textAlignment = NSTextAlignment.left
        label_ValCaseno.textColor = Constants.Constants.COLOR_APPTHEME
        label_ValCaseno.text = "32164347"
        label_ValCaseno.backgroundColor = UIColor.clear
        self.contentView.addSubview(label_ValCaseno)
        
        label_ValClaimno = UILabel(frame: CGRect(x:label_ValCaseno.frame.maxX,y:0,width:UIScreen.main.bounds.size.width/3-3,height:40))
        label_ValClaimno.font = UIFont(name: "Roboto-Regular", size: 14.0)
        label_ValClaimno.textAlignment = NSTextAlignment.center
        label_ValClaimno.textColor = UIColor.black
        label_ValClaimno.text = "#112"
        label_ValClaimno.backgroundColor = UIColor.clear
        self.contentView.addSubview(label_ValClaimno)
        
        label_ValExaminee = UILabel(frame: CGRect(x:label_ValClaimno.frame.maxX,y:0,width:UIScreen.main.bounds.size.width/3-3,height:40))
        label_ValExaminee.font = UIFont(name: "Roboto-Regular", size: 14.0)
        label_ValExaminee.textAlignment = NSTextAlignment.right
        label_ValExaminee.textColor = UIColor.black
        label_ValExaminee.text = "Maria Leon"
        label_ValExaminee.backgroundColor = UIColor.clear
        self.contentView.addSubview(label_ValExaminee)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
