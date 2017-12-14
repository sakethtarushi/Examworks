//
//  SignUpViewController.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 11/24/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class SignUpViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    
    
    // Tableview Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "signUp") as! SignUpTableViewCell
       cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textfieldnumtwo?.isHidden = true
        cell.textfieldnumone?.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width/2-20, height: 49)
        cell.border1.frame = CGRect(x: 0, y: cell.textfieldnumone.frame.size.height - 1.0, width:  cell.textfieldnumone.frame.size.width, height: cell.textfieldnumone.frame.size.height)

        cell.textfieldnumtwo?.frame = CGRect.init(x: (cell.textfieldnumone.frame).maxX+20, y: 10, width: UIScreen.main.bounds.size.width/2-20, height: 49)
        cell.border2.frame = CGRect(x: 0, y: cell.textfieldnumtwo.frame.size.height - 1.0, width:  cell.textfieldnumtwo.frame.size.width, height: cell.textfieldnumtwo.frame.size.height)
        cell.textfieldnumone?.delegate = self
        cell.textfieldnumtwo?.delegate = self
        cell.textfieldnumone?.autocorrectionType = .no
        cell.textfieldnumtwo?.autocorrectionType = .no

        switch indexPath.row {
        case 0:
            cell.textfieldnumtwo?.isHidden = false
            cell.textfieldnumone?.placeholder = "First Name"
            cell.textfieldnumtwo?.placeholder = "Last Name"

            break
        case 1:
            cell.textfieldnumtwo?.isHidden = true
            cell.textfieldnumone?.placeholder = "Company"
            cell.textfieldnumtwo?.placeholder = ""
            cell.textfieldnumone?.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width-20, height: 49)
            cell.border1.frame = CGRect(x: 0, y: cell.textfieldnumone.frame.size.height - 1.0, width:  cell.textfieldnumone.frame.size.width, height: cell.textfieldnumone.frame.size.height)

            break
        case 2:
            cell.textfieldnumtwo?.isHidden = true
            cell.textfieldnumone?.placeholder = "Email Address"
            cell.textfieldnumtwo?.placeholder = ""
            cell.textfieldnumone?.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width-20, height: 49)
            cell.border1.frame = CGRect(x: 0, y: cell.textfieldnumone.frame.size.height - 1.0, width:  cell.textfieldnumone.frame.size.width, height: cell.textfieldnumone.frame.size.height)

            break
        case 3:
            cell.textfieldnumtwo?.isHidden = true
            cell.textfieldnumone?.placeholder = "Phone Number + Ext"
            cell.textfieldnumtwo?.placeholder = ""
            cell.textfieldnumone?.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width-20, height: 49)
            cell.border1.frame = CGRect(x: 0, y: cell.textfieldnumone.frame.size.height - 1.0, width:  cell.textfieldnumone.frame.size.width, height: cell.textfieldnumone.frame.size.height)

            break
        case 4:
            cell.textfieldnumtwo?.isHidden = true
            cell.textfieldnumone?.placeholder = "Address Line 1"
            cell.textfieldnumtwo?.placeholder = ""
            cell.textfieldnumone?.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width-20, height: 49)
            cell.border1.frame = CGRect(x: 0, y: cell.textfieldnumone.frame.size.height - 1.0, width:  cell.textfieldnumone.frame.size.width, height: cell.textfieldnumone.frame.size.height)

            break
        case 5:
            cell.textfieldnumtwo?.isHidden = true
            cell.textfieldnumone?.placeholder = "Address Line 2"
            cell.textfieldnumtwo?.placeholder = ""
            cell.textfieldnumone?.frame = CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.size.width-20, height: 49)
            cell.border1.frame = CGRect(x: 0, y: cell.textfieldnumone.frame.size.height - 1.0, width:  cell.textfieldnumone.frame.size.width, height: cell.textfieldnumone.frame.size.height)

            break
        case 6:
            cell.textfieldnumtwo?.isHidden = false
            cell.textfieldnumone?.placeholder = "City"
            cell.textfieldnumtwo?.placeholder = "State"
            break
        case 7:
            cell.textfieldnumtwo?.isHidden = false
            cell.textfieldnumone?.placeholder = "Zip Code"
            cell.textfieldnumtwo?.placeholder = "Country"
            break
       
        default:
            break
        }
        

        cell.backgroundColor  = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    var tableview_SignUp:UITableView!
    var btn_SignUp : UIButton!
    var view_SignUp : UIView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.navigationController?.navigationBar.isTranslucent = false

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Up Navigation Bar Title
        
        let label_title = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 32))
        label_title.textAlignment = NSTextAlignment.center
        label_title.textColor = UIColor.white
        label_title.text = "Sign Up"
        self.navigationItem.titleView = label_title
        
        
        view_SignUp = UIView(frame:CGRect(x: 0, y:0, width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height - 60))
        view_SignUp.backgroundColor = UIColor.clear
        self.view.addSubview(view_SignUp);
        
        
        // Set Up tableview for signup
        
        tableview_SignUp = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.view_SignUp.frame.size.height))
        tableview_SignUp.delegate = self
        tableview_SignUp.dataSource = self
        view_SignUp.addSubview(tableview_SignUp)
        tableview_SignUp.tableFooterView = UITableView.init(frame: CGRect.zero)
        tableview_SignUp.separatorStyle = UITableViewCellSeparatorStyle.none
        // Set Signup Button
        
        btn_SignUp = UIButton(type: .custom)
        btn_SignUp.frame = CGRect.init(x: 20, y: self.view_SignUp.frame.size.height - 65, width: UIScreen.main.bounds.size.width - 40, height: 53)
        btn_SignUp.backgroundColor = Constants.Constants.COLOR_APPTHEME
        btn_SignUp.layer.cornerRadius = 5.0
        btn_SignUp.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_SignUp.setTitle("Sign Up", for: .normal)
        btn_SignUp.addTarget(self, action: #selector(action_SignUp), for: .touchUpInside)
        view_SignUp.addSubview(btn_SignUp)
        tableview_SignUp.register(UINib(nibName: "SignUpTableViewCell", bundle: nil), forCellReuseIdentifier: "signUp")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Action for SignUp
    
    @objc func action_SignUp(){
        

    }
    
    override func updateFramesForOrientation() {
        
        view_SignUp.frame = CGRect(x: 0, y:0, width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height - 60)

        tableview_SignUp.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.view_SignUp.frame.size.height-60)
        
        btn_SignUp.frame = CGRect.init(x: 20, y: self.view_SignUp.frame.size.height - 65, width: UIScreen.main.bounds.size.width - 40, height: 53)
        
        tableview_SignUp.reloadData()

    }
    
    // MARK: Textfield Delegate methods
    
  
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
      func textFieldDidBeginEditing(_ textField: UITextField) // became first responder

    {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            
            self.tableview_SignUp.frame = CGRect.init(x: 0, y:0 , width: UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height - 64.0 - 260 )
            
        })
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    //    UIView.animate(withDuration: 0.5, animations: {

            self.tableview_SignUp.frame = CGRect.init(x: 0, y: 0, width:  UIScreen.main.bounds.size.width, height: self.view_SignUp.frame.size.height - 60)
            
    //    })
        
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
