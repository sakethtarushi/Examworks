//
//  CustomButtonView.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 11/28/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

// Write the Protocol Declaration Here
protocol ButtonDelegate {
    
    func buttonDidPressed(sender : CustomButtonView)
    
}

class CustomButtonView: BaseView {
    
    var label_Tile : UILabel!
    var label_subtitle : UILabel!
    var imageview_image : UIImageView!
    var delegate : ButtonDelegate?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        commoninit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func commoninit(){
        
        self.backgroundColor = UIColor.green
        imageview_image = UIImageView(frame: CGRect(x:5,y:6,width:21,height:26))
        self.addSubview(imageview_image)
        
        label_Tile = UILabel(frame: CGRect(x:(self.frame.size.width) - 65,y:6,width:55,height:32))
        label_Tile.font = UIFont(name: "Roboto-Bold", size: 22.0)
        label_Tile.textAlignment = NSTextAlignment.right
        label_Tile.textColor = UIColor.white
        label_Tile.text = "1000"
        label_Tile.backgroundColor = UIColor.clear
        self.addSubview(label_Tile)
        
        label_subtitle = UILabel(frame: CGRect(x:25,y:(self.frame.size.height) - 22 - 6,width:(self.frame.size.width) - 30,height:22))
        label_subtitle.font = UIFont(name: "Roboto-Regular", size: 10.0)
        label_subtitle.textAlignment = NSTextAlignment.right
        label_subtitle.textColor = UIColor.white
        label_subtitle.text = "Awaiting Report Approval"
        label_subtitle.backgroundColor = UIColor.clear
        self.addSubview(label_subtitle)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapEvent))
        addGestureRecognizer(tap)
        self.addGestureRecognizer(tap)
        
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
    @objc func tapEvent(_ sender: UITapGestureRecognizer) {
       self.buttonDidPressed(self)
    }
    
    @objc func buttonDidPressed(_ selfObjectRefernce: CustomButtonView) {
        if (delegate != nil) {
            delegate?.buttonDidPressed(sender: self)
        }
    }
    
    func setColor(color : UIColor){
        
        self.backgroundColor = color
        
        
    }
    
    func setUserInteractionEnabled(_ userInteractionEnabled: Bool) {
        super.isUserInteractionEnabled = userInteractionEnabled
    }
    
  
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
