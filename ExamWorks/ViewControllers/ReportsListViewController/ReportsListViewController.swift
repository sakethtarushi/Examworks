//
//  ReportsListViewController.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/13/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class ReportsListViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
  
    

    var tableview_Reportlist:UITableView!
    var btn_Add:UIButton!

    
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
        label_title.text = "Report List"
        self.navigationItem.titleView = label_title
        // Do any additional setup after loading the view.
        
        createviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createviews(){
        
        tableview_Reportlist = UITableView()
        tableview_Reportlist.backgroundColor = UIColor.clear
        tableview_Reportlist.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height-64);
        tableview_Reportlist.dataSource    =   self
        tableview_Reportlist.delegate      =   self
        tableview_Reportlist.register(UINib(nibName: "ReportListTableViewCell", bundle: nil), forCellReuseIdentifier: "reportslistcell")
        
        
        tableview_Reportlist.tableFooterView = UITableView.init(frame: CGRect.zero)
        self.view.addSubview(tableview_Reportlist)
        
        btn_Add = UIButton(type: .custom)
        btn_Add.frame = CGRect(x:UIScreen.main.bounds.size.width-100, y:UIScreen.main.bounds.size.height-50, width:80, height:44)
        btn_Add.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_Add.backgroundColor = UIColor.red
        btn_Add.setTitleColor(UIColor.white, for: .normal)
        btn_Add.addTarget(self, action: #selector(action_add), for: .touchUpInside)
        self.view.addSubview(btn_Add)
        
        
        
        
        
    }
    
    override func updateFramesForOrientation() {

        
        
        
    }
    @objc func action_add(){
        
        
    }
    
    
    // Tableview Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "reportslistcell") as! ReportListTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.accessoryType = .none
            cell.backgroundColor  = UIColor.clear
            return cell
      
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        // let view_nonne = UIView()
        
        
        
        let view_footer = UIView()
        view_footer.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 60)
        var btn_view : UIButton!
        btn_view = UIButton(type: .custom)
        btn_view.frame = CGRect(x:UIScreen.main.bounds.size.width - 70, y:0, width:60, height:60)
        btn_view.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_view.setImage(UIImage.init(named: "add"), for: UIControlState.normal)
        btn_view.addTarget(self, action: #selector(action_add), for: .touchUpInside)
        view_footer.addSubview(btn_view)
        
        return view_footer
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
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
