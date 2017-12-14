//
//  HomeViewController.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 25/11/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,ButtonDelegate, UITableViewDataSource,UITableViewDelegate,APIRequestDelegate {

    
    var label_Displayname : UILabel!
    var label_Date : UILabel!
    var button_first : CustomButtonView!
    var tblview_Clients : UITableView!
    var ary_MedicalRecords:Array<MedicalRecordModel>!
    var awaitingreport_Dictation : String!
    var newmedicalreportsadded : String!
    var awaitingreport_Approval : String!
    var pendingpatment : String!
    var awaitingappt_att_conformation : String!
    var currentmonthcumulativecases : String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM yyyy"
        let result = formatter.string(from: date as Date)
        
        formatter.dateFormat = "dd/MM/yyyy"
        let date_today = formatter.string(from: date as Date)
        
        self.view.backgroundColor = UIColor.white
        self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: UIScreen.main.bounds.size.width, height: self.view.frame.size.height)
        var width_Lbls:CGFloat!
        
        width_Lbls = (self.view.frame.size.width-15)/2
        
        label_Displayname = UILabel(frame: CGRect(x:5,y:60,width:width_Lbls,height:32))
        label_Displayname.font = UIFont(name: "Roboto-Medium", size: 14.0)
        label_Displayname.textAlignment = NSTextAlignment.left
        label_Displayname.textColor = UIColor.black
//        label_Displayname.text = String.init(format: "Hello! %@.%@", self.loggedInUserObject.str_UserType,self.loggedInUserObject.str_UserName)
        label_Displayname.text = UserDefaults.standard.object(forKey: "displayname") as? String
        label_Displayname.backgroundColor = UIColor.clear
        self.view.addSubview(label_Displayname)
        
//        label_Date = UILabel(frame: CGRect(x:self.view.frame.size.width - width_Lbls - 5,y:60,width:width_Lbls,height:32))
        label_Date = UILabel(frame: CGRect(x:self.view.frame.size.width-width_Lbls-5,y:60,width:width_Lbls,height:32))
        label_Date.font = UIFont(name: "Roboto-Medium", size: 14.0)
        label_Date.textAlignment = NSTextAlignment.right
        label_Date.textColor = UIColor.lightGray
        label_Date.text = result
        label_Date.backgroundColor = UIColor.clear
        self.view.addSubview(label_Date)
        

        self.createMainViews()
        
        // Service Calls For DashBoard Tiles
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION)
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_AWAITINGREPORTAPPROVAL)
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION)
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_MEDICALRECOEDSADDED)
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_PENDINGPAYMENTS)
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_CURRENTMONTHCUMULATIVES)
        servicecallforDashBoard(key: APIRequest.APIKey.API_DOCTORSCHEDULE)
     //   servicecallforDashBoard(key: String.init(format: "%@/Dashboard/DoctorDailySchedule?apptDate=%@&doctorcode=%@",Constants.Constants.APP_BASE_URL,date_today,UserDefaults.standard.object(forKey: "userCode")))

        // Do any additional setup after loading the view.
    }
    
  
    func createMainViews() {
        
        let point_TableViewYOrigin = label_Displayname.frame.maxY
        
        tblview_Clients = UITableView()
        tblview_Clients.backgroundColor = UIColor.clear
        tblview_Clients.frame = CGRect(x:0, y:point_TableViewYOrigin, width:self.view.frame.size.width, height:self.view.frame.size.height-point_TableViewYOrigin);
        tblview_Clients.dataSource    =   self
        tblview_Clients.delegate      =   self
        tblview_Clients.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tblview_Clients.tableFooterView = UITableView.init(frame: CGRect.zero)
        self.view.addSubview(tblview_Clients)
    }
    
    
    // MARK: Tableview delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        
        cell.button_first1.delegate = self
        cell.button_second1.delegate = self
        cell.button_third1.delegate = self
        cell.button_fourth1.delegate = self
        cell.button_fifth1.delegate = self
        cell.button_sixth1.delegate = self

        cell.button_first1?.label_Tile.text = "5"
        cell.button_first1?.label_subtitle.text = "Awaiting Report / Dictation"
        cell.button_first1?.imageview_image.image = UIImage(named: "Report Approval")

        cell.button_second1?.label_Tile.text = "0"
        cell.button_second1?.label_subtitle.text = "New Medical Records Added"
        cell.button_second1?.imageview_image.image = UIImage(named: "Report Approval")

        
        cell.button_third1?.label_Tile.text = "35"
        cell.button_third1?.label_subtitle.text = "Awaiting Report Approval"
        cell.button_third1?.imageview_image.image = UIImage(named: "Report Approval")

        
        cell.button_fourth1?.label_Tile.text = "$100"
        cell.button_fourth1?.label_subtitle.text = "Pending Payment"
        cell.button_fourth1?.imageview_image.image = UIImage(named: "Report Approval")

        cell.button_fifth1?.label_Tile.text = "10"
        cell.button_fifth1?.label_subtitle.text = "Awaiting Appt Att Confirmation"
        cell.button_fifth1?.imageview_image.image = UIImage(named: "Report Approval")

        cell.button_sixth1?.label_Tile.text = "45"
        cell.button_sixth1?.label_subtitle.text = "Current Month Cumulative Cases"
        cell.button_sixth1?.imageview_image.image = UIImage(named: "Current Month")
        cell.button_sixth1?.imageview_image.image = UIImage(named: "Report Approval")

        
        if indexPath.row == 0 {
            
            cell.button_first1.isHidden = false
            cell.button_second1.isHidden = false
            cell.button_third1.isHidden = false
            cell.button_fourth1.isHidden = false
            cell.button_fifth1.isHidden = false
            cell.button_sixth1.isHidden = false

        }
        else {

            cell.button_first1.isHidden = true
            cell.button_second1.isHidden = true
            cell.button_third1.isHidden = true
            cell.button_fourth1.isHidden = true
            cell.button_fifth1.isHidden = true
            cell.button_sixth1.isHidden = true
            
        }

        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 250
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        let casedetailobj = CaseListViewController.init(nibName: "CaseListViewController", bundle: nil)
        self.navigationController?.pushViewController(casedetailobj, animated: true)

        
    }
    
    // MARK: =======
    
    override func updateFramesForOrientation() {
        print("Orientation change in home view frank")
        
        self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: UIScreen.main.bounds.size.width, height: self.view.frame.size.height)
        
        var width_Lbls:CGFloat!
        
        width_Lbls = (self.view.frame.size.width-15)/2

        
        label_Displayname.frame = CGRect(x:5,y:60,width:width_Lbls,height:32)

        label_Date.frame = CGRect(x:self.view.frame.size.width-width_Lbls-5,y:60,width:width_Lbls,height:32)
        
        
        let point_TableViewYOrigin = label_Displayname.frame.maxY

        tblview_Clients.frame = CGRect(x:0, y:point_TableViewYOrigin, width:self.view.frame.size.width, height:self.view.frame.size.height-point_TableViewYOrigin);

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: ===== Service Calls =====
    
    func servicecallforDashBoard(key : APIRequest.APIKey) {
        
        let apiRequestObj = APIRequest().requestWithKey(apiKey:key)
        apiRequestObj.apiRequestDelegate = self
        apiRequestObj.invokeWith(parameters: nil, headers: ["Authorization" : UserDefaults.standard.object(forKey: "base64") as! String,"Content-Type" : "application/json","AppToken" : "TestApplicationToken",UserDefaults.standard.object(forKey: "usertoken") as! AnyHashable : "UserToken"])

    }
    
    
    
    func requestFinished(request: APIRequest) {
        
        
        if request.apiKeyForRequestIs == APIRequest.APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION_DETAIL {
            print("Response for awaitingreportDictation method \n \(request.dictionary_Response)")
            
            
//            let casedetailobj = CaseListViewController.init(nibName: "CaseListViewController", bundle: nil)
//            self.navigationController?.pushViewController(casedetailobj, animated: true)
        }

        print("Request finished with response\(request.dictionary_Response) for request \(request.apiKeyForRequestIs)")

        if request.apiKeyForRequestIs == APIRequest.APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION {
            print("Response for awaitingreportDictation method \n \(request.dictionary_Response)")
        }
        else if request.apiKeyForRequestIs == APIRequest.APIKey.API_DASHBOARD_AWAITINGREPORTAPPROVAL{
            print("Response for awaitingreportApproval method \n \(request.dictionary_Response)")

        }
        else if request.apiKeyForRequestIs == APIRequest.APIKey.API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION{
            print("Response for awaitingreportConformation method \n \(request.dictionary_Response)")

        }
        else if request.apiKeyForRequestIs == APIRequest.APIKey.API_DASHBOARD_MEDICALRECOEDSADDED{
            print("Response for MedicalRecordsAdded method \n \(request.dictionary_Response)")

        }
        else if request.apiKeyForRequestIs == APIRequest.APIKey.API_DASHBOARD_PENDINGPAYMENTS{
            print("Response for PendingPayments method \n \(request.dictionary_Response)")

        }
        else if request.apiKeyForRequestIs == APIRequest.APIKey.API_DASHBOARD_CURRENTMONTHCUMULATIVES{
            print("Response for CurrentMonthCumulatives method \n \(request.dictionary_Response)")
        }
       
        else{
 
        }
    }
    
    func requestFailed(request: APIRequest, withError: Error) {
        print("Request failed with error\(withError)")
    }
    
    
    // MARK: Cell method
    
    func buttonDidPressed(sender: CustomButtonView) {
        
        let indexPath = IndexPath(item: 0, section: 0)

        let cell = tblview_Clients.cellForRow(at: indexPath) as! HomeTableViewCell
        
        if sender == cell.button_first1 {
            servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION_DETAIL)

        }
        else if sender == cell.button_second1{
            servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_RECORDSADDEDDETAILGRID)

        }
        else if sender == cell.button_third1{
            servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_AWAITINGREPORTAPPROVAL_DETAIL)

        }
        else if sender == cell.button_fourth1{
            servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_PENDINGPAYMENTS_DETAIL)

        }
        else if sender == cell.button_fifth1{
            servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION_DETAIL)

        }
        else{
            servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_CURRENTMONTHCUMULATIVES_DETAIL)

        }
        
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
