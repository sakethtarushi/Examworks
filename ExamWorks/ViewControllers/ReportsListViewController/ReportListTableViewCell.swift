//
//  ReportListTableViewCell.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/13/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class ReportListTableViewCell: UITableViewCell {
    var lbl_ReportTitle : UILabel!
    var lbl_Reporttime : UILabel!
    var lbl_ReportDetail : UILabel!
    var button_Delete : UIButton!
    var button_Share : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        lbl_ReportTitle = UILabel(frame: CGRect(x:5,y:6,width:UIScreen.main.bounds.size.width/2,height:25))
        lbl_ReportTitle.font = UIFont(name: "Roboto-Bold", size: 18.0)
        lbl_ReportTitle.textAlignment = NSTextAlignment.left
        lbl_ReportTitle.textColor = Constants.Constants.COLOR_APPTHEME
        lbl_ReportTitle.text = "Report #1"
        lbl_ReportTitle.backgroundColor = UIColor.clear
        self.addSubview(lbl_ReportTitle)
        
        lbl_Reporttime = UILabel(frame: CGRect(x:UIScreen.main.bounds.size.width - 10 - 100,y:6,width:100,height:25))
        lbl_Reporttime.font = UIFont(name: "Roboto-Regular", size: 14.0)
        lbl_Reporttime.textAlignment = NSTextAlignment.right
        lbl_Reporttime.textColor = UIColor.black
        lbl_Reporttime.text = "21-SEP-2017"
        lbl_Reporttime.backgroundColor = UIColor.clear
        self.addSubview(lbl_Reporttime)
        
        
        lbl_ReportDetail = UILabel(frame: CGRect(x:5,y:lbl_ReportTitle.frame.maxY+5.0,width:UIScreen.main.bounds.size.width - 100,height:32))
        lbl_ReportDetail.font = UIFont(name: "Roboto-Regular", size: 14.0)
        lbl_ReportDetail.textAlignment = NSTextAlignment.left
        lbl_ReportDetail.textColor = UIColor.black
        lbl_ReportDetail.text = "Healthy,robust,contracting,heartly,robust and contracting like a lung."
        lbl_ReportDetail.backgroundColor = UIColor.clear
        lbl_ReportDetail.numberOfLines = 0
        lbl_ReportDetail.lineBreakMode = .byWordWrapping
        self.addSubview(lbl_ReportDetail)
        
        button_Share = UIButton(type: .custom)
        button_Share.frame = CGRect(x:UIScreen.main.bounds.size.width - 60, y:lbl_ReportDetail.frame.maxY, width:24, height:24)
        button_Share.backgroundColor = UIColor.clear
        button_Share.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        button_Share.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
        //   button_Share.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        button_Share.setImage(UIImage.init(named: "share"), for: UIControlState.normal)
        self.addSubview(button_Share)
        
        button_Delete = UIButton(type: .custom)
        button_Delete.frame = CGRect(x:UIScreen.main.bounds.size.width - 30, y:lbl_ReportDetail.frame.maxY, width:24, height:24)
        button_Delete.backgroundColor = UIColor.clear
        button_Delete.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        button_Delete.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
        button_Delete.setImage(UIImage.init(named: "delete"), for: UIControlState.normal)
        self.addSubview(button_Delete)
        
        
        
    }
    
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
