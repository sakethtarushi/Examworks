//
//  BaseViewController.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 22/11/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    

    var imgView_Background:UIImageView!
    var lbl_Copyright:UILabel!
    
    var view_Header:UIView!
    var view_Left:UIView!
    var view_Right:UIView!
    var lbl_Title:UILabel!
    var img_Header:UIImageView!
    
    
    var loggedInUserObject:UserModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        

        imgView_Background = UIImageView(frame: UIScreen.main.bounds)
        self.view.addSubview(imgView_Background)
        
        
//        lbl_Copyright = UILabel(frame: CGRect(x:0,y:UIScreen.main.bounds.size.height-24-10,width:UIScreen.main.bounds.size.width,height:24))
//        lbl_Copyright.textAlignment = NSTextAlignment.center
//        lbl_Copyright.textColor = UIColor.black
//        lbl_Copyright.font = UIFont.systemFont(ofSize: 12.0)
//        lbl_Copyright.text = "©2017 ExamWorks Group. Inc"
//        self.view.addSubview(lbl_Copyright)
        // Do any additional setup after loading the view.
    }
    
    func createHeaderView(withBackgroundcolor: UIColor, leftView: UIView?, rightView: UIView?, isText: Bool, isImage: Bool, title: String, image: UIImage?) {
        
        view_Header = UIView()
        view_Header.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64)
        view_Header.autoresizingMask = [.flexibleWidth]
        view_Header.backgroundColor = withBackgroundcolor
        self.view.addSubview(view_Header)
        
        view_Left = UIView(frame:CGRect.zero)
        if leftView != nil {
            view_Left = leftView!
            self.view.addSubview(view_Left)
        }
        
        view_Right = UIView(frame:CGRect.zero)
        if rightView != nil {
            view_Right = rightView!
            self.view.addSubview(view_Right)
        }
        
        lbl_Title = UILabel(frame: CGRect(x: view_Left.frame.origin.x, y: 20, width: view_Header.frame.size.width-view_Right.frame.origin.x-view_Left.frame.origin.x, height: view_Header.frame.size.height-20))
        lbl_Title.autoresizingMask = [.flexibleLeftMargin,.flexibleRightMargin]
        lbl_Title.font = UIFont(name: "Roboto-Bold", size: 20.0)
        lbl_Title.textAlignment = .center
        lbl_Title.textColor = UIColor.white
        self.view.addSubview(lbl_Title)
        
        
        img_Header = UIImageView(frame: CGRect(x: view_Left.frame.origin.x, y: 20, width: view_Header.frame.size.width-view_Right.frame.origin.x, height: view_Header.frame.size.height-20))
        self.view.addSubview(img_Header)
        
        if isImage {
            img_Header.image = image;
        }
        
        if isText {
            lbl_Title.text = title
        }
        
    }
    
    
    func updateFramesForOrientation() {
        
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            let orient = UIApplication.shared.statusBarOrientation
            
            switch orient {
                
            case .portrait:
                
                print("Portrait")
                
            case .landscapeLeft,.landscapeRight :
                
                print("Landscape")
                
            default:
                
                print("Anything But Portrait")
            }
            
        }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            self.updateFramesForOrientation()
        })
        super.viewWillTransition(to: size, with: coordinator)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
