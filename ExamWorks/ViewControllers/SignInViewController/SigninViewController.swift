//
//  SigninViewController.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 23/11/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
import ACProgressHUD_Swift

class SigninViewController: BaseViewController, UITextFieldDelegate, APIRequestDelegate  {
    
    // MARK: Variable declarations
    
    var imgView_Logo:UIImageView!
    var view_MainBtns:UIView!
    var textField_Username:FloatLabelTextField!
    var textField_Password:FloatLabelTextField!
    var btn_SignIn:UIButton!
    var btn_Back:UIButton!
    var btn_HavingTroubleSignIn:UIButton!
    var border1 = CALayer()
    var border2 = CALayer()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
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

        
        self.addMainButtonsOnScreen()
        
    }
    
    // MARK: Orientation method
    
    override func updateFramesForOrientation() {
        self.imgView_Background.frame = CGRect(x:0,y:UIScreen.main.bounds.size.height-111,width:UIScreen.main.bounds.size.width,height:111)
        
        imgView_Logo.frame = CGRect(x: (UIScreen.main.bounds.size.width-195)/2, y: 100, width: 195, height: 40)
        view_MainBtns.frame = CGRect(x: 0, y:(UIScreen.main.bounds.size.height-(32+32+10+10+32))/2, width: UIScreen.main.bounds.size.width, height:32+32+10+10+32)
        textField_Username.frame = CGRect(x: 20, y: 10, width: UIScreen.main.bounds.size.width-40, height: 32)
        textField_Password.frame = CGRect(x: 20, y: textField_Username.frame.maxY+32.0, width: UIScreen.main.bounds.size.width-40, height: 32)
        btn_SignIn.frame = CGRect(x:20, y:view_MainBtns.frame.maxY+10.0, width:UIScreen.main.bounds.size.width-40, height:48)

        
        
        let border1 = CALayer()
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.lightGray.cgColor
        border1.frame = CGRect(x: 0, y: textField_Username.frame.size.height - width1, width:  textField_Username.frame.size.width, height: textField_Username.frame.size.height)
        
        border1.borderWidth = width1
        textField_Username.layer.addSublayer(border1)
        textField_Username.layer.masksToBounds = true
        let border2 = CALayer()
        let width2 = CGFloat(1.0)
        border2.borderColor = UIColor.lightGray.cgColor
        border2.frame = CGRect(x: 0, y: textField_Password.frame.size.height - width2, width:  textField_Password.frame.size.width, height: textField_Password.frame.size.height)
        
        border2.borderWidth = width2
        textField_Password.layer.addSublayer(border2)
        textField_Password.layer.masksToBounds = true
        
        btn_HavingTroubleSignIn.frame = CGRect(x:20, y:(btn_SignIn.frame).maxY+50, width:UIScreen.main.bounds.size.width-40, height:30)

    }
    
    // MARK: Applcation methods
    
    @objc func actionBack()  {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addMainButtonsOnScreen() {
        
        view_MainBtns = UIView(frame:CGRect(x: 0, y:(UIScreen.main.bounds.size.height-(32+32+10+10+32))/2, width: UIScreen.main.bounds.size.width, height:32+32+10+10+32))
        view_MainBtns.backgroundColor = UIColor.clear
        
        
        textField_Username = FloatLabelTextField(frame: CGRect(x: 20, y: 10, width: UIScreen.main.bounds.size.width-40, height: 32))
        textField_Username.delegate = self
        textField_Username.placeholder = "Username"
        textField_Username.font = UIFont(name: "Roboto-Medium", size: 14.0)
        view_MainBtns.addSubview(textField_Username)
        
        //Adding bottom border to textfield
        
        let width1 = CGFloat(1.0)
        border1.borderColor = UIColor.lightGray.cgColor
        border1.frame = CGRect(x: 0, y: textField_Username.frame.size.height - width1, width:  textField_Username.frame.size.width, height: textField_Username.frame.size.height)
        
        border1.borderWidth = width1
        textField_Username.layer.addSublayer(border1)
        textField_Username.layer.masksToBounds = true
        
        //Adding textfield image view
        
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        let image1 = UIImage(named: "user")
        imageView1.image = image1
        imageView1.contentMode = UIViewContentMode.scaleAspectFit
        textField_Username.leftView = imageView1
        
        textField_Username.leftViewMode = UITextFieldViewMode.always
        textField_Username.leftViewMode = .always
        
        textField_Password = FloatLabelTextField(frame: CGRect(x: 20, y: textField_Username.frame.maxY+32.0, width: UIScreen.main.bounds.size.width-40, height: 32))
        textField_Password.delegate = self
        textField_Password.placeholder = "Password"
        textField_Password.isSecureTextEntry = true
        textField_Password.font = UIFont(name: "Roboto-Medium", size: 14.0)
        view_MainBtns.addSubview(textField_Password)
        
        //Adding bottom border to textfield
        
        let width2 = CGFloat(1.0)
        border2.borderColor = UIColor.lightGray.cgColor
        border2.frame = CGRect(x: 0, y: textField_Password.frame.size.height - width2, width:  textField_Password.frame.size.width, height: textField_Password.frame.size.height)
        
        border2.borderWidth = width2
        textField_Password.layer.addSublayer(border2)
        textField_Password.layer.masksToBounds = true
        
        //Adding textfield image view
        
        let imageView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 20));
        let image2 = UIImage(named: "password");
        imageView2.image = image2;
        imageView2.contentMode = UIViewContentMode.scaleAspectFit
        textField_Password.leftView = imageView2;
        
        textField_Password.leftViewMode = UITextFieldViewMode.always
        textField_Password.leftViewMode = .always
        
        self.view.addSubview(view_MainBtns)

        textField_Username.text = "kfhanley@gmail.com"
        textField_Password.text = "LetMeIn"
        
        btn_SignIn = UIButton(type: .custom)
        btn_SignIn.frame = CGRect(x:20, y:view_MainBtns.frame.maxY+10.0, width:UIScreen.main.bounds.size.width-40, height:48)
        btn_SignIn.backgroundColor = Constants.Constants.COLOR_APPTHEME
        btn_SignIn.layer.cornerRadius = 5.0
        btn_SignIn.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_SignIn.setTitle("Sign In", for: .normal)
        btn_SignIn.addTarget(self, action: #selector(actionSignIn), for: .touchUpInside)
        self.view.addSubview(btn_SignIn)
        
        
        
        btn_HavingTroubleSignIn = UIButton(type: .custom)
        btn_HavingTroubleSignIn.frame = CGRect(x:20, y:(btn_SignIn.frame).maxY+50, width:UIScreen.main.bounds.size.width-40, height:30)
        btn_HavingTroubleSignIn.backgroundColor = UIColor.clear
        btn_HavingTroubleSignIn.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_HavingTroubleSignIn.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
        btn_HavingTroubleSignIn.setTitle("Having Trouble Sign In?", for: .normal)
        btn_HavingTroubleSignIn.addTarget(self, action: #selector(action_Forgotpassword), for: .touchUpInside)
        self.view.addSubview(btn_HavingTroubleSignIn)
    }
    
    @objc func actionSignIn() -> Void {
        
        // Service call goes here
        
        let progressView = ACProgressHUD.shared
        progressView.progressText = "Signing In.."
        progressView.showHUD()
        
        let apiRequestObj = APIRequest().requestWithKey(apiKey: APIRequest.APIKey.API_LOGIN)
        apiRequestObj.apiRequestDelegate = self
        apiRequestObj.invokeWith(parameters: ["DBID":"23","UserName":self.textField_Username.text!,"Password":self.textField_Password.text!], headers: ["Authorization" : "Basic VGVzdEFwcGxpY2F0aW9uVG9rZW46M2ZmYjZlNjEtZWQ0Yi00YTZjLTkzMmQtMmVlZjU0M2Y5NDNk",
            "Content-Type" : "application/json","AppToken" : "TestApplicationToken"])
        
    }
    
    func requestFinished(request: APIRequest) {
        
        let progressView = ACProgressHUD.shared
        progressView.progressText = ""
        progressView.hideHUD()
        
        print("Request finished with response\(request.dictionary_Response) for request \(request.apiKeyForRequestIs)")
        
        
     /*   var userDict:Dictionary<String, String>!
        
        userDict = Dictionary()
        
        let responseDict = request.dictionary_Response["response"] as! Dictionary<String,String>
        
        for case let key as String in responseDict.keys {
            print("Response dictionary \(key)")
        }
 
        
        UserDefaults.standard.set(request.dictionary_Response["response"], forKey: "LoggedInUserDict")
        UserDefaults.standard.synchronize()
        
        self.loggedInUserObject = UserModel.getUserObjectForDictionary(dict_User: request.dictionary_Response as! Dictionary<String, String>) */
        
        if request.apiKeyForRequestIs == APIRequest.APIKey.API_LOGIN {
            print("Response for login method")
            
            var dict_ResponseOuter:Dictionary<String,AnyObject>
            
            dict_ResponseOuter = request.dictionary_Response
            let  longstring = dict_ResponseOuter["sessionToken"] as! String
            print("Session token is \(String(describing: longstring))")
            
            var test:String!
            
            test = String.init(format: "TestApplicationToken:%@", longstring)
            
            let session = test
            
            let data = (session)?.data(using: String.Encoding.utf8)
            let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            
            print("Base64 of Session token is \(base64)")// dGVzdDEyMw==\n
            let  displayname = dict_ResponseOuter["displayName"] as! String
       
            Util().storeUserDefaults(withObject:String.init(format: "Basic %@", base64), andKey:"base64")
            Util().storeUserDefaults(withObject:longstring, andKey:"usertoken")
            Util().storeUserDefaults(withObject:displayname, andKey:"displayname")

            self.actionPushHome()
        }
        
    }
    
    func requestFailed(request: APIRequest, withError: Error) {
         print("Request failed with error\(withError)")
        
        let progressView = ACProgressHUD.shared
        progressView.progressText = ""
        progressView.hideHUD()
    }
    
    func actionPushHome() {
        let vcPagination = PaginationViewController()
        self.navigationController?.pushViewController(vcPagination, animated: true)
    }
    // MARK: Textfield Delegate methods

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func action_Forgotpassword() {
        
        let forgotpasswordobj = ForgotPasswordViewController.init(nibName: "ForgotPasswordViewController", bundle: nil)
        self.navigationController?.pushViewController(forgotpasswordobj, animated: true)
        
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField){
        if (textField==self.textField_Username) {
            border1.borderColor = UIColor(red: 0/255.0, green: 136/255.0, blue: 196/255.0, alpha: 1.00).cgColor
        }
        else{
            
            border2.borderColor = UIColor(red: 0/255.0, green: 136/255.0, blue: 196/255.0, alpha: 1.00).cgColor ;
            
        }
        
        
    }
    // became first responder
    public func textFieldDidEndEditing(_ textField: UITextField){
        
        if (textField==self.textField_Username) {
            border1.borderColor=UIColor.lightGray.cgColor;
        }
        else{
            
            border2.borderColor=UIColor.lightGray.cgColor;
            
        }
        
        
        
        
    }            // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
