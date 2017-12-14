//
//  MedicalRecordViewController.swift
//  ExamWorks
//
//  Created by Saven Developer on 11/27/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class MedicalRecordViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,APIRequestDelegate,UIImagePickerControllerDelegate{
    
    var tableview_Medicalrecord:UITableView!
    var ary_Titles : [AnyHashable] = ["Name","Home Phone","Address","Patient ID","Birth Date","Status","Gender","Martial Status","Race","Soc Sec No","Language","MRN","Referred By","Extenal ID"]
    
    var ary_MedicalRecords:Array<MedicalRecordModel>!
    let imagePicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ary_MedicalRecords = Array()

        // Set Up Navigation Bar Title
        
        let label_title = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 32))
        label_title.textAlignment = NSTextAlignment.center
        label_title.textColor = UIColor.white
        label_title.text = "Medical Records"
        self.navigationItem.titleView = label_title
        
        
        tableview_Medicalrecord = UITableView()
        tableview_Medicalrecord.backgroundColor = UIColor.clear
        tableview_Medicalrecord.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height-60-20);
        tableview_Medicalrecord.dataSource    =   self
        tableview_Medicalrecord.delegate      =   self
        tableview_Medicalrecord.register(UINib(nibName: "MedicalRecordTableViewCell", bundle: nil), forCellReuseIdentifier: "MedicalRecordcell")
        
        
        tableview_Medicalrecord.tableFooterView = UITableView.init(frame: CGRect.zero)
        self.view.addSubview(tableview_Medicalrecord)
        
        servicecallforDashBoard(key: APIRequest.APIKey.API_DASHBOARD_RECORDSADDEDDETAILGRID)

        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    // Tableview Delegate Methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return ary_MedicalRecords.count
        case 1:
            return 1
 
        default:
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 0 {
            let web = WebViewController.init(nibname: "WebViewController", bundlepath: nil, filepath: String.init(format: "%@/Case/%@/File/%@", Constants.Constants.APP_BASE_URL, ary_MedicalRecords[indexPath.row].str_CaseNbr,ary_MedicalRecords[indexPath.row].str_claimNbr))
            self.navigationController?.pushViewController(web, animated: true)

        }
        
        else{
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)

            
            
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
            label_title.text = "Patient Information"
        case 1:
            label_title.text = "Problems"

        default:
            label_title.text = ""
        }
        return view_header
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicalRecordcell") as! MedicalRecordTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.lbl_MedicalRecordTitle?.frame =  CGRect(x:10,y:6,width:(UIScreen.main.bounds.size.width/2 - 10),height:32)
        cell.lbl_MedicalRecordValue?.frame =  CGRect(x:(UIScreen.main.bounds.size.width/2 + 10),y:6,width:(UIScreen.main.bounds.size.width/2 - 10 - 10),height:32)
        

        switch indexPath.section {
        case 0:
            cell.lbl_MedicalRecordValue.isHidden = false
            
            let obj_MedicalRecord = ary_MedicalRecords[indexPath.row]
            cell.lbl_MedicalRecordTitle?.text = obj_MedicalRecord.str_Description
            cell.lbl_MedicalRecordValue?.text = ""
            break
        case 1:
            cell.lbl_MedicalRecordTitle?.frame =  CGRect(x:10,y:6,width:(UIScreen.main.bounds.size.width-20),height:32)
            cell.lbl_MedicalRecordValue.isHidden = true
            cell.lbl_MedicalRecordTitle?.text="DIABETES MELLITUS (ICD-250.) HYPERTENSION, BENIGN ESSENTIAL (ICD-401.1)"
            
            break
                   
        default:
            break
        }
        
        cell.backgroundColor  = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if (info[UIImagePickerControllerOriginalImage] as? UIImage) != nil {
           
            print("Image picked is:%@",info);
        
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: ===== Service Calls =====
    
    func servicecallforDashBoard(key : APIRequest.APIKey) {
        
        let apiRequestObj = APIRequest().requestWithKey(apiKey:key)
        apiRequestObj.apiRequestDelegate = self
        apiRequestObj.invokeWith(parameters: nil, headers: ["Authorization" : UserDefaults.standard.object(forKey: "base64") as! String,"Content-Type" : "application/json","AppToken" : "TestApplicationToken",UserDefaults.standard.object(forKey: "usertoken") as! AnyHashable : "UserToken"])
        
    }
    
    func servicecallforUpload() {
        
        let apiRequestObj = APIRequest().requestWithKey(apiKey:APIRequest.APIKey.API_UPLOADDOCUMENT)
        apiRequestObj.apiRequestDelegate = self
        apiRequestObj.invokeWith(parameters: ["description" : "testdata","docType" : "test"], headers: ["Authorization" : UserDefaults.standard.object(forKey: "base64") as! String])
        
    }
    
    
    
    
    func requestFinished(request: APIRequest) {
        
        
        let ary_MedicalRecordDicObjects = request.dictionary_Response["response"] as! Array<Dictionary<String,String>>
        
        
        for dict_MedicalRecord in ary_MedicalRecordDicObjects {
            var obj_MedicalRecord:MedicalRecordModel!
            obj_MedicalRecord = MedicalRecordModel.getMedicalRecordObjectForDictionary(dict_MedicalModel: dict_MedicalRecord)
           
            ary_MedicalRecords.append(obj_MedicalRecord)
        }
        
        print("Request finished with medical record response \(ary_MedicalRecords)")

        tableview_Medicalrecord.reloadData()
        
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
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
