//
//  DictateReportTableViewCell.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/7/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class DictateReportTableViewCell: UITableViewCell {
    var lbl_ReportTitle : UILabel!
    var lbl_ReportDate : UILabel!
    var lbl_Reporttime : UILabel!
    var button_Download : UIButton!
    var button_Share : UIButton!
    var button_Delete : UIButton!
    var button_Pause : UIButton!
    var slider_report : UISlider!
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
        
        lbl_ReportDate = UILabel(frame: CGRect(x:UIScreen.main.bounds.size.width - 10 - 100,y:6,width:100,height:25))
        lbl_ReportDate.font = UIFont(name: "Roboto-Regular", size: 14.0)
        lbl_ReportDate.textAlignment = NSTextAlignment.right
        lbl_ReportDate.textColor = UIColor.black
        lbl_ReportDate.text = "21-SEP-2017"
        lbl_ReportDate.backgroundColor = UIColor.clear
        self.addSubview(lbl_ReportDate)
        
        
        button_Pause = UIButton(type: .custom)
        button_Pause.frame = CGRect(x:8, y:lbl_ReportTitle.frame.maxY+5.0, width:24, height:24)
        button_Pause.backgroundColor = UIColor.clear
        button_Pause.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
      //  button_Pause.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        button_Pause.setImage(UIImage.init(named: "pause_play"), for: UIControlState.normal)
        self.addSubview(button_Pause)
        
        
        slider_report = UISlider(frame:CGRect(x: button_Pause.frame.maxX+5.0, y: lbl_ReportTitle.frame.maxY+5.0, width: UIScreen.main.bounds.size.width - 29-24-5-24-5-50-5-30-5, height: 32))
        slider_report.minimumValue = 0
        slider_report.maximumValue = 100
        slider_report.isContinuous = true
        slider_report.tintColor = Constants.Constants.COLOR_APPTHEME
      //  slider_report.addTarget(self, action: #selector(ViewController.sliderValueDidChange(_:)), for: .valueChanged)
        self.addSubview(slider_report)

        lbl_Reporttime = UILabel(frame: CGRect(x:UIScreen.main.bounds.size.width - 29-24-5-24-5-50-5,y:lbl_ReportTitle.frame.maxY+5.0,width:50,height:24))
        lbl_Reporttime.font = UIFont(name: "Roboto-Regular", size: 17.0)
        lbl_Reporttime.textAlignment = NSTextAlignment.right
        lbl_Reporttime.textColor = UIColor.gray
        lbl_Reporttime.text = "12:22"
        lbl_Reporttime.backgroundColor = UIColor.clear
        self.addSubview(lbl_Reporttime)
        
        
        button_Share = UIButton(type: .custom)
        button_Share.frame = CGRect(x:UIScreen.main.bounds.size.width - 29-24-5-24-5, y:lbl_ReportTitle.frame.maxY+5.0, width:24, height:24)
        button_Share.backgroundColor = UIColor.clear
        button_Share.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        button_Share.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
     //   button_Share.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        button_Share.setImage(UIImage.init(named: "share"), for: UIControlState.normal)
        self.addSubview(button_Share)
        
        button_Download = UIButton(type: .custom)
        button_Download.frame = CGRect(x:UIScreen.main.bounds.size.width - 29-24-5, y:lbl_ReportTitle.frame.maxY+5.0, width:24, height:24)
        button_Download.backgroundColor = UIColor.clear
        button_Download.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        button_Download.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
        button_Download.setImage(UIImage.init(named: "download"), for: UIControlState.normal)
        self.addSubview(button_Download)
        
        button_Delete = UIButton(type: .custom)
        button_Delete.frame = CGRect(x:UIScreen.main.bounds.size.width - 29, y:lbl_ReportTitle.frame.maxY+5.0, width:24, height:24)
        button_Delete.backgroundColor = UIColor.clear
        button_Delete.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        button_Delete.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
   //     button_Delete.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        button_Delete.setImage(UIImage.init(named: "delete"), for: UIControlState.normal)
        self.addSubview(button_Delete)
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
