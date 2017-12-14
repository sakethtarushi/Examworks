//
//  CaseDetailsViewController.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/1/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class CaseDetailsViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,APIRequestDelegate {
    
    var tableview_CaseDetails:UITableView!
    
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
        label_title.text = "Case Details"
        self.navigationItem.titleView = label_title
        
        createMainViews()
        //  tableview_CaseDetails.tableHeaderView = gettableviewheader(heighth:70)
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_CASEDETAIL)
        
        
        // Do any additional setup after loading the view.
    }
    
    func createMainViews() {
        
        tableview_CaseDetails = UITableView()
        tableview_CaseDetails.backgroundColor = UIColor.clear
        tableview_CaseDetails.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height-60-20);
        tableview_CaseDetails.dataSource    =   self
        tableview_CaseDetails.delegate      =   self
        tableview_CaseDetails.register(UINib(nibName: "CaseDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableview_CaseDetails.register(UINib(nibName: "CasedetailsCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "casecustomcell")
        
        
        tableview_CaseDetails.tableFooterView = UITableView.init(frame: CGRect.zero)
        self.view.addSubview(tableview_CaseDetails)
        
        tableview_CaseDetails.tableHeaderView = gettableviewheader(heighth:110)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func servicecallforDashBoard(key : APIRequest.APIKey) {
        
        let apiRequestObj = APIRequest().requestWithKey(apiKey:key)
        apiRequestObj.apiRequestDelegate = self
        apiRequestObj.invokeWith(parameters: nil, headers: ["Authorization" : UserDefaults.standard.object(forKey: "base64") as! String,"Content-Type" : "application/json","AppToken" : "TestApplicationToken",UserDefaults.standard.object(forKey: "usertoken") as! AnyHashable : "UserToken"])
        
    }
    
    func requestFinished(request: APIRequest) {
        /*   print("Request finished with response\(request.dictionary_Response) for request \(request.apiKeyForRequestIs)")
         
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
         */
    }
    
    func requestFailed(request: APIRequest, withError: Error) {
        print("Request failed with error\(withError)")
    }
    
    
    
    func gettableviewheader(heighth : CGFloat) -> UIView {
        
        var view_HeaderTemp : UIView!
        var label_Client : UILabel!
        var label_Time : UILabel!
        var label_CaseNo : UILabel!
        var imageview_image : UIImageView!
        var label_Location : UILabel!
        var label_Status : UILabel!
        
        view_HeaderTemp = UIView()
        view_HeaderTemp.frame = CGRect(x: 10, y:0, width: UIScreen.main.bounds.size.width, height:heighth)
        label_Client = UILabel()
        label_Client.frame = CGRect(x:5,y:5,width:(view_HeaderTemp.frame.size.width/2-5) ,height:20)
        label_Client.font = UIFont(name: "Roboto-Bold", size: 20.0)
        label_Client?.textAlignment = NSTextAlignment.left
        label_Client?.textColor = Constants.Constants.COLOR_APPTHEME
        label_Client?.text = "Client: Maria Leon"
        view_HeaderTemp.addSubview(label_Client!)
        
        label_Time = UILabel(frame: CGRect(x:view_HeaderTemp.frame.size.width,y:6,width:(view_HeaderTemp.frame.size.width/2-10),height:32))
        label_Time.font = UIFont(name: "Roboto-Regular", size: 14.0)
        label_Time.textAlignment = NSTextAlignment.right
        label_Time.textColor = UIColor.orange
        label_Time.text = "Time:10:00AM"
        label_Time.backgroundColor = UIColor.clear
        view_HeaderTemp.addSubview(label_Time)
        
        label_CaseNo = UILabel(frame: CGRect(x:10,y:label_Client!.frame.maxY+5,width:(view_HeaderTemp.frame.size.width/2-5) ,height:20))
        label_CaseNo.font = UIFont(name: "Roboto-Regular", size: 14.0)
        label_CaseNo.textAlignment = NSTextAlignment.left
        label_CaseNo.textColor = UIColor.darkGray
        label_CaseNo.text = "Case No:2222034"
        view_HeaderTemp.addSubview(label_CaseNo)
        
        imageview_image = UIImageView(frame: CGRect(x:5,y:label_CaseNo.frame.maxY + 5,width:9,height:14))
        imageview_image.image = UIImage(named: "Report Approval")
        view_HeaderTemp.addSubview(imageview_image)
        
        label_Location = UILabel(frame: CGRect(x:10,y:label_CaseNo!.frame.maxY+5,width:(view_HeaderTemp.frame.size.width/2-10 - imageview_image.frame.size.width),height:20))
        label_Location.font = UIFont(name: "Roboto-Regular", size: 14.0)
        label_Location.textAlignment = NSTextAlignment.left
        label_Location.textColor = UIColor.darkGray
        label_Location.text = "MA-Medford Office"
        view_HeaderTemp.addSubview(label_Location)
        
        
        label_Status = UILabel(frame: CGRect(x:view_HeaderTemp.frame.size.width/2,y:label_Location.frame.origin.y,width:(view_HeaderTemp.frame.size.width/2-10),height:32))
        label_Status.font = UIFont(name: "Roboto-Medium", size: 14.0)
        label_Status.textAlignment = NSTextAlignment.right
        label_Status.textColor = UIColor.init(red: 24.0/256.0, green: 150.0/256.0, blue: 82.0/256.0, alpha: 1.0)
        label_Status.text = "Status:Complete"
        label_Status.backgroundColor = UIColor.clear
        view_HeaderTemp.addSubview(label_Status)
        
        return view_HeaderTemp
        
    }
    
    
    // Tableview Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 9
        case 1:
            return 2
        case 2:
            return 3
        case 3:
            return 2
        case 4:
            return 4
            
        default:
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let ary_Title = ["Examinee","Physician","Cliam Number/Ext","App Date","Date Of Loss","Service","IME-MA: MMI Attaomed?:","Treatment Weeks:","Report Turnaround Time:"]
            let ary_Value = ["Almonte","Physician","-","-","-","_","_","_","_"]
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CaseDetailsTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.label_Tile?.text = ary_Title[indexPath.row]
            cell.label_Value?.text = ary_Value[indexPath.row]
            cell.accessoryType = .none
            cell.backgroundColor  = UIColor.clear
            return cell
            
        }
            
        else{
            var ary_refral = ["View Medical Record","View Cover Letter"]
            let ary_report = ["Dictate a Report","Create a Report","Review / Edit / View a Report"]
            let ary_videoimages = ["View Survelliance Video","View Images Record"]
            let ary_radiology = ["View MRI Scan","View CT Scan","View Pet Scan","View Pet Scan"]
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "casecustomcell") as! CasedetailsCustomTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.accessoryType = .disclosureIndicator
            cell.backgroundColor  = UIColor.clear
            
            switch indexPath.section {
            case 1:
                cell.label_Header?.text = ary_refral[indexPath.row]
                break
            case 2:
                cell.label_Header?.text = ary_report[indexPath.row]
                break
            case 3:
                cell.label_Header?.text = ary_videoimages[indexPath.row]
                break
            case 4:
                cell.label_Header?.text = ary_radiology[indexPath.row]
                break
            default:
                cell.label_Header?.text = ""
            }
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let obj = MedicalRecordViewController.init(nibName: "MedicalRecordViewController", bundle: nil)
            self.navigationController?.pushViewController(obj, animated: true)
            
        }
        else if indexPath.section == 2 {
            
            switch indexPath.row {
            case 0:
                let obj = AuidoRecorderViewController.init(nibName: "AuidoRecorderViewController", bundle: nil)
                self.navigationController?.pushViewController(obj, animated: true)
                break;
                
            case 1:
                let obj = DictateReportViewController.init(nibName: "DictateReportViewController", bundle: nil)
                self.navigationController?.pushViewController(obj, animated: true)
                break;
                
            case 2:
                let obj = ReportsListViewController.init(nibName: "ReportsListViewController", bundle: nil)
                self.navigationController?.pushViewController(obj, animated: true)
                break;
                
            default:
                break;
                
                
            }
           
        }
        else if indexPath.section == 3 {
            let obj = SurvellianceVideoViewController.init(nibName: "SurvellianceVideoViewController", bundle: nil)
            self.navigationController?.pushViewController(obj, animated: true)

        }
        else if indexPath.section == 4 {
         
        }
    }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view_header = UIView()
            view_header.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
            
            var label_title : UILabel!
            label_title = UILabel(frame: CGRect(x:5,y:6,width:UIScreen.main.bounds.size.width-10,height:32))
            label_title.font = UIFont(name: "Roboto-Bold", size: 18.0)
            label_title.textAlignment = NSTextAlignment.left
            label_title.textColor = UIColor.black
            label_title.text = "Title"
            label_title.backgroundColor = UIColor.clear
            view_header.addSubview(label_title)
            switch section {
            case 0:
                label_title.text = "Referal Details"
            case 1:
                label_title.text = "Referal Details"
            case 2:
                label_title.text = "Report"
            case 3:
                label_title.text = "Video and Images"
            case 4:
                label_title.text = "Radiology"
                
            default:
                label_title.text = ""
            }
            return view_header
            
        }
        
        func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            
            // let view_nonne = UIView()
            
            
            
            let view_footer = UIView()
            view_footer.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
            
            var btn_view : UIButton!
            btn_view = UIButton(type: .custom)
            btn_view.frame = CGRect(x:10, y:0, width:UIScreen.main.bounds.size.width - 20, height:44)
            btn_view.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
            btn_view.setTitleColor(UIColor.white, for: .normal)
            btn_view.tag = section
            btn_view.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
            view_footer.addSubview(btn_view)
            
            if section == 0 {
                btn_view.setTitle("Catch My Note", for: .normal)
                btn_view.backgroundColor = UIColor.init(red: 78/255, green: 197/255, blue: 204/255, alpha: 1.0)
                
            }
            else if section == 4{
                btn_view.setTitle("Upload and Send Invoice", for: .normal)
                btn_view.backgroundColor = UIColor.init(red: 227/255, green: 133/255, blue: 36/255, alpha: 1.0)
                
                
            }
                
            else{
                
                
            }
            
            return view_footer
            
            
            
        }
        
        @objc func actionBack(){
            
            
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            
            switch section {
            case 0:
                return 50
            case 1:
                return 0
            case 2:
                return 0
            case 3:
                return 0
            case 4:
                return 50
                
            default:
                return 0
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
