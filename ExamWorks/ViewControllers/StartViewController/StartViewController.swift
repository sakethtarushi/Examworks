//
//  StartViewController.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 22/11/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController {
    
    var imgView_Logo:UIImageView!
    var view_MainBtns:UIView!
    var btn_SignIn:UIButton!
    var btn_SignUp:UIButton!
    var btn_NeedHelp:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        
        //Add Background Image
        
        self.imgView_Background.frame = CGRect(x:0,y:UIScreen.main.bounds.size.height-111,width:UIScreen.main.bounds.size.width,height:111)
        self.imgView_Background.image = UIImage(named:"Background")
        
        
        imgView_Logo = UIImageView()
        imgView_Logo.frame = CGRect(x: (UIScreen.main.bounds.size.width-195)/2, y: 70, width: 195, height: 40)
        imgView_Logo.image = UIImage(named: "Logo")
        self.view.addSubview(imgView_Logo)
        
        
        self.addMainButtonsOnScreen()
        
    }
    
    func addMainButtonsOnScreen() {
        
        view_MainBtns = UIView(frame:CGRect(x: 0, y:(UIScreen.main.bounds.size.height-(48+48+10+10+50))/2, width: UIScreen.main.bounds.size.width, height:48+48+10+10+50))
        view_MainBtns.backgroundColor = UIColor.clear
        
        btn_SignIn = UIButton(type: .custom)
        btn_SignIn.frame = CGRect(x:20, y:10, width:UIScreen.main.bounds.size.width-40, height:48)
        btn_SignIn.backgroundColor = Constants.Constants.COLOR_GRAY
        btn_SignIn.layer.cornerRadius = 5.0
        btn_SignIn.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_SignIn.setTitle("Sign In", for: .normal)
        btn_SignIn.tag = 420
        btn_SignIn.addTarget(self, action: #selector(action_SignIn), for:.touchUpInside)
        view_MainBtns.addSubview(btn_SignIn)
        
        btn_SignUp = UIButton(type: .custom)
        btn_SignUp.frame = CGRect(x:20, y:(btn_SignIn.frame).maxY+50, width:UIScreen.main.bounds.size.width-40, height:48)
        btn_SignUp.backgroundColor = Constants.Constants.COLOR_APPTHEME
        btn_SignUp.layer.cornerRadius = 5.0
        btn_SignUp.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_SignUp.setTitle("Not Yet Registered? Sign Up", for: .normal)
        btn_SignUp.addTarget(self, action: #selector(action_Signup), for: .touchUpInside)
        view_MainBtns.addSubview(btn_SignUp)
        
        
        self.view.addSubview(view_MainBtns)
        
        
        
        btn_NeedHelp = UIButton(type: .custom)
        btn_NeedHelp.frame = CGRect(x:20, y:UIScreen.main.bounds.size.height-30-100, width:UIScreen.main.bounds.size.width-40, height:30)
        btn_NeedHelp.backgroundColor = UIColor.clear
        btn_NeedHelp.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_NeedHelp.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
        btn_NeedHelp.setTitle("Need Help?", for: .normal)
        self.view.addSubview(btn_NeedHelp)
    }
    
    @objc func action_SignIn(sender: UIButton!) {
       print("Dummy log with tag",sender.tag)
        
        let vc_SignIn = SigninViewController(nibName: "SigninViewController", bundle: nil)
        self.navigationController?.pushViewController(vc_SignIn, animated: true)
    }
    
    @objc func action_Signup(){
        
        let signUpobj = SignUpViewController.init(nibName: "SignUpViewController", bundle: nil)
        self.navigationController?.pushViewController(signUpobj, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    // MARK: Orientation change method
    
    override func updateFramesForOrientation() {
        self.imgView_Background.frame = CGRect(x:0,y:UIScreen.main.bounds.size.height-111,width:UIScreen.main.bounds.size.width,height:111)

        imgView_Logo.frame = CGRect(x: (UIScreen.main.bounds.size.width-195)/2, y: 70, width: 195, height: 40)

        view_MainBtns.frame = CGRect(x: 0, y:(UIScreen.main.bounds.size.height-(48+48+10+10+50))/2, width: UIScreen.main.bounds.size.width, height:48+48+10+10+50)
        btn_SignIn.frame = CGRect(x:20, y:10, width:UIScreen.main.bounds.size.width-40, height:48)
        btn_SignUp.frame = CGRect(x:20, y:(btn_SignIn.frame).maxY+50, width:UIScreen.main.bounds.size.width-40, height:48)
        btn_NeedHelp.frame = CGRect(x:20, y:UIScreen.main.bounds.size.height-30-100, width:UIScreen.main.bounds.size.width-40, height:30)

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
