//
//  ForgotPasswordViewController.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 11/24/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController,UITextFieldDelegate {

    
    var imgView_Logo:UIImageView!
    var textField_Email:UITextField!
    var label_HavingTrouble:UILabel!
    var btn_Send:UIButton!
    var btn_Back : UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.imgView_Background.frame = CGRect(x:0,y:UIScreen.main.bounds.size.height-111,width:UIScreen.main.bounds.size.width,height:111)
        self.imgView_Background.image = UIImage(named:"Background")
        
        
        imgView_Logo = UIImageView()
        imgView_Logo.frame = CGRect(x: (UIScreen.main.bounds.size.width-195)/2, y: 100, width: 195, height: 40)
        imgView_Logo.image = UIImage(named: "Logo")
        self.view.addSubview(imgView_Logo)
        
        btn_Back = UIButton(type: .custom)
        btn_Back.frame = CGRect(x:15, y:25, width:20, height:20)
        btn_Back.backgroundColor = UIColor.clear
        btn_Back.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_Back.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
        btn_Back.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        btn_Back.setImage(UIImage.init(named: "Back Icon"), for: UIControlState.normal)
        self.view.addSubview(btn_Back)
        
        label_HavingTrouble = UILabel.init(frame: CGRect.init(x: 20, y: (imgView_Logo.frame).maxY+30, width: UIScreen.main.bounds.size.width - 40, height: 60))
        label_HavingTrouble.textAlignment = NSTextAlignment.left
        label_HavingTrouble.text = "Don't worry. It happends to anyone. Just send us your email address and we will send you new one."
        label_HavingTrouble?.font = UIFont(name: "Roboto-Regular", size: 14.0)
        label_HavingTrouble.textColor = UIColor.lightGray
        label_HavingTrouble.lineBreakMode = .byWordWrapping
        label_HavingTrouble.numberOfLines = 0
        self.view.addSubview(label_HavingTrouble)
        
        
        textField_Email = UITextField.init(frame: CGRect.init(x: 20, y: (label_HavingTrouble.frame).maxY+30, width: UIScreen.main.bounds.size.width - 40, height: 32))
        textField_Email.borderStyle = UITextBorderStyle.none
        textField_Email.placeholder = "Email"
        textField_Email.delegate = self
        textField_Email?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        textField_Email?.textAlignment = NSTextAlignment.left
        self.view.addSubview(textField_Email);
        
        let txt_layer = CALayer()
        let width = CGFloat(0.5)
        txt_layer.borderColor = UIColor.lightGray.cgColor
        txt_layer.frame = CGRect.init(x: 0, y: textField_Email.frame.size.height - width, width: textField_Email.frame.size.width, height: textField_Email.frame.size.height)
        txt_layer.borderWidth = width
        textField_Email.layer.addSublayer(txt_layer)
        textField_Email.layer.masksToBounds = true
        
        
        //Adding textfield image view
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 20));
        let image2 = UIImage(named: "email");
        imageView2.image = image2;
        imageView2.contentMode = UIViewContentMode.scaleAspectFit
        textField_Email.leftView = imageView2;
        
        textField_Email.leftViewMode = UITextFieldViewMode.always
        textField_Email.leftViewMode = .always
        
        btn_Send = UIButton(type: .custom)
        btn_Send.frame = CGRect(x:20, y:(textField_Email.frame).maxY+50, width:UIScreen.main.bounds.size.width-40, height:53)
        btn_Send.backgroundColor = Constants.Constants.COLOR_APPTHEME
        btn_Send.layer.cornerRadius = 5.0
        btn_Send.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_Send.setTitle("Send", for: .normal)
        self.view.addSubview(btn_Send);
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Textfield Delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func actionBack(){
        
        self.navigationController?.popViewController(animated: true)
        
        
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
