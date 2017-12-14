//
//  CaseListViewController.swift
//  ExamWorks
//
//  Created by Saven Developer on 12/6/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class CaseListViewController: BaseViewController,UITableViewDataSource, UITableViewDelegate,CollapsibleTableViewHeaderDelegate {

    var tableview_CaseList:UITableView!
    var ary_CaseList:Array<MedicalRecordModel>!
    var sections = sectionsData

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
        label_title.text = "Case List"
        self.navigationItem.titleView = label_title
        
        createMainViews()
        // Do any additional setup after loading the view.
    }

    
    func createMainViews() {
        
        tableview_CaseList = UITableView()
        tableview_CaseList.backgroundColor = UIColor.clear
        tableview_CaseList.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height-60-20);
        tableview_CaseList.dataSource    =   self
        tableview_CaseList.delegate      =   self
//        tableview_CaseList.register(UINib(nibName: "CaseDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
       tableview_CaseList.register(UINib(nibName: "CaseListTableViewCell", bundle: nil), forCellReuseIdentifier: "Caselistcell")
        
        tableview_CaseList.tableHeaderView = getheaderviewforcaselist()
        tableview_CaseList.tableFooterView = UITableView.init(frame: CGRect.zero)
        self.view.addSubview(tableview_CaseList)
        
    }
    
    
    // Tableview Delegate Methods
    
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let view_header = UIView()
//        view_header.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
//
//        let label_caseno = UILabel(frame: CGRect(x:3,y:0,width:view_header.frame.size.width/3-3,height:50))
//        label_caseno.font = UIFont(name: "Roboto-Bold", size: 18.0)
//        label_caseno.textAlignment = NSTextAlignment.left
//        label_caseno.textColor = UIColor.black
//        label_caseno.text = "Case Number"
//        label_caseno.backgroundColor = UIColor.clear
//        view_header.addSubview(label_caseno)
//
//        let label_claimno = UILabel(frame: CGRect(x:label_caseno.frame.maxX,y:0,width:view_header.frame.size.width/3-3,height:50))
//        label_claimno.font = UIFont(name: "Roboto-Bold", size: 18.0)
//        label_claimno.textAlignment = NSTextAlignment.center
//        label_claimno.textColor = UIColor.black
//        label_claimno.text = "Claim Number"
//        label_claimno.backgroundColor = UIColor.clear
//        view_header.addSubview(label_claimno)
//
//
//        let label_Examinee = UILabel(frame: CGRect(x:label_claimno.frame.maxX,y:0,width:view_header.frame.size.width/3-3,height:50))
//        label_Examinee.font = UIFont(name: "Roboto-Bold", size: 18.0)
//        label_Examinee.textAlignment = NSTextAlignment.right
//        label_Examinee.textColor = UIColor.black
//        label_Examinee.text = "Examinee"
//        label_Examinee.backgroundColor = UIColor.clear
//        view_header.addSubview(label_Examinee)
//
//
//        return view_header
//    }
//
//            func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//                return 50
//            }
//
//            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//                return 40
//            }
//

//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Caselistcell") as! CaseListTableViewCell
//        cell.selectionStyle = UITableViewCellSelectionStyle.none
//        cell.accessoryType = .none
//        cell.backgroundColor  = UIColor.clear
//
//        return cell
//
//
//    }

    // MARK: - View Controller DataSource and Delegate
    //
    
    
    func getheaderviewforcaselist() -> UIView {
        
                let view_header = UIView()
                view_header.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
        
                let label_caseno = UILabel(frame: CGRect(x:3,y:0,width:view_header.frame.size.width/3-3,height:50))
                label_caseno.font = UIFont(name: "Roboto-Bold", size: 18.0)
                label_caseno.textAlignment = NSTextAlignment.left
                label_caseno.textColor = UIColor.black
                label_caseno.text = "Case Number"
                label_caseno.backgroundColor = UIColor.clear
                view_header.addSubview(label_caseno)
        
                let label_claimno = UILabel(frame: CGRect(x:label_caseno.frame.maxX,y:0,width:view_header.frame.size.width/3-3,height:50))
                label_claimno.font = UIFont(name: "Roboto-Bold", size: 18.0)
                label_claimno.textAlignment = NSTextAlignment.center
                label_claimno.textColor = UIColor.black
                label_claimno.text = "Claim Number"
                label_claimno.backgroundColor = UIColor.clear
                view_header.addSubview(label_claimno)
        
        
                let label_Examinee = UILabel(frame: CGRect(x:label_claimno.frame.maxX,y:0,width:view_header.frame.size.width/3-3,height:50))
                label_Examinee.font = UIFont(name: "Roboto-Bold", size: 18.0)
                label_Examinee.textAlignment = NSTextAlignment.right
                label_Examinee.textColor = UIColor.black
                label_Examinee.text = "Examinee"
                label_Examinee.backgroundColor = UIColor.clear
                view_header.addSubview(label_Examinee)
        
        
                return view_header
    }
    
         func numberOfSections(in tableView: UITableView) -> Int {
            return sections.count
        }
        
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sections[section].collapsed ? 0 : sections[section].items.count
        }
        
        // Cell
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "Caselistcell") as! CaseListTableViewCell
                    cell.selectionStyle = UITableViewCellSelectionStyle.none
                    cell.accessoryType = .none
                    cell.backgroundColor  = UIColor.clear
            
            return cell
        }
        
         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 40
        }
        
        // Header
         func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
            
            header.arrowLabel.text = ">"
            header.setCollapsed(sections[section].collapsed)
           // header.setCollapsed(true)
            
            header.section = section
            header.delegate = self
            return header
        }
        
         func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 44.0
        }
        
         func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 1.0
        }
    
    
                func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
                    let obj = CaseDetailsViewController.init(nibName: "CaseDetailsViewController", bundle: nil)
                    self.navigationController?.pushViewController(obj, animated: true)
    
                }
    
    
    //
    // MARK: - Section Header Delegate
    //
    
        func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
            let collapsed = !sections[section].collapsed

            // Toggle collapse
            sections[section].collapsed = collapsed
            header.setCollapsed(collapsed)
            
            tableview_CaseList.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
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
