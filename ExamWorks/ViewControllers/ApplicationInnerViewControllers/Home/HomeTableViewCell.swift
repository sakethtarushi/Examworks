//
//  HomeTableViewCell.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 29/11/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell,ButtonDelegate {

    var button_first1 : CustomButtonView!
    var button_second1 : CustomButtonView!
    var button_third1 : CustomButtonView!
    var button_fourth1 : CustomButtonView!
    var button_fifth1 : CustomButtonView!
    var button_sixth1 : CustomButtonView!
    var label_Tile : UILabel!
    var label_subtitle : UILabel!
    var imageview_image : UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
        //button_first = UIView(frame:CGRect(x: 10, y:5, width: UIScreen.main.bounds.size.width/2 - 10, height:70))
        
        button_first1 = CustomButtonView.init(frame: CGRect(x: 10, y:5, width: UIScreen.main.bounds.size.width/2 - 20, height:60))
        button_first1?.backgroundColor = UIColor.init(red: 107/255, green: 217/255, blue:125/255 , alpha: 1.0)
        button_first1.imageview_image.image = UIImage(named: "Report Approval")
        self.contentView.addSubview(button_first1!)

        button_second1 = CustomButtonView.init(frame: CGRect(x:UIScreen.main.bounds.size.width/2 + 10  , y:5, width: UIScreen.main.bounds.size.width/2 - 20, height:60))
        button_second1?.backgroundColor = UIColor.init(red: 204/255, green: 156/255, blue:75/255 , alpha: 1.0)

        self.contentView.addSubview(button_second1!)
        
        button_third1 = CustomButtonView.init(frame: CGRect(x: 10, y:button_first1.frame.maxY + 10, width: UIScreen.main.bounds.size.width/2 - 20, height:60))
        button_third1?.backgroundColor = UIColor.init(red: 229/255, green: 83/255, blue:89/255 , alpha: 1.0)
        self.contentView.addSubview(button_third1!)
        
        button_fourth1 = CustomButtonView.init(frame: CGRect(x: UIScreen.main.bounds.size.width/2 + 10 , y:button_first1.frame.maxY + 10, width: UIScreen.main.bounds.size.width/2 - 20, height:60))
        button_fourth1?.backgroundColor = UIColor.init(red: 78/255, green: 197/255, blue:204/255 , alpha: 1.0)
        button_fourth1.imageview_image.image = UIImage(named: "Pending Payment")

        self.contentView.addSubview(button_fourth1!)
        
        button_fifth1 = CustomButtonView.init(frame:CGRect(x: 10, y:button_third1.frame.maxY + 10, width: UIScreen.main.bounds.size.width/2 - 20, height:60))
        button_fifth1?.backgroundColor = UIColor.init(red: 204/255, green: 156/255, blue:75/255 , alpha: 1.0)
        button_fifth1.imageview_image.image = UIImage(named: "Report Approval")
        self.contentView.addSubview(button_fifth1!)
        
        button_sixth1 = CustomButtonView.init(frame: CGRect(x: UIScreen.main.bounds.size.width/2 + 10 , y:button_third1.frame.maxY + 10, width: UIScreen.main.bounds.size.width/2 - 20, height:60))
        button_sixth1?.backgroundColor = UIColor.init(red: 107/255, green: 217/255, blue:125/255 , alpha: 1.0)
       button_sixth1.imageview_image.image = UIImage(named: "Pending Payment")

        self.contentView.addSubview(button_sixth1!)
        

    }
    
    func getCustomViewforTiles(frame_set : CGRect) -> UIView {
        
        
        let view_set = UIView()
        view_set.frame = frame_set
        
        imageview_image = UIImageView(frame: CGRect(x:5,y:6,width:21,height:26))
        imageview_image.image = UIImage(named: "Report Approval")
        view_set.addSubview(imageview_image)
        
        label_Tile = UILabel(frame: CGRect(x:(view_set.frame.size.width) - 65,y:6,width:55,height:32))
        label_Tile.font = UIFont(name: "Roboto-Bold", size: 22.0)
        label_Tile.textAlignment = NSTextAlignment.right
        label_Tile.textColor = UIColor.white
        label_Tile.text = "1000"
        label_Tile.backgroundColor = UIColor.clear
        view_set.addSubview(label_Tile)
        
        label_subtitle = UILabel(frame: CGRect(x:25,y:(view_set.frame.size.height) - 22 - 6,width:(view_set.frame.size.width) - 30,height:22))
        label_subtitle.font = UIFont(name: "Roboto-Regular", size: 10.0)
        label_subtitle.textAlignment = NSTextAlignment.right
        label_subtitle.textColor = UIColor.white
        label_subtitle.text = "Awaiting Report Approval"
        label_subtitle.backgroundColor = UIColor.clear
        view_set.addSubview(label_subtitle)
        
        
        return view_set
    }
 
  
    

    func buttonDidPressed(sender: CustomButtonView) {
        print("Button presseddddd hardly..")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
    
}
