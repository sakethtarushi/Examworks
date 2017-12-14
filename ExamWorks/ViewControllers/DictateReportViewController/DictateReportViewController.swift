//
//  DictateReportViewController.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/7/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class DictateReportViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    var tableview_Dictatereport:UITableView!
    var button_audio : UIButton!

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

        let label_title = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 32))
        label_title.textAlignment = NSTextAlignment.center
        label_title.textColor = UIColor.white
        label_title.text = "Dictate Report"
        self.navigationItem.titleView = label_title
        
        createViewsforReport()
        
        // Do any additional setup after loading the view.
    }

    func createViewsforReport(){
        
        
        button_audio = UIButton(type: .custom)
        button_audio.frame = CGRect(x:UIScreen.main.bounds.size.width/2 - 30, y:UIScreen.main.bounds.size.height - 75-10, width:74, height:75)
        button_audio.backgroundColor = UIColor.clear
        button_audio.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        button_audio.setTitleColor(UIColor.init(red: 154.0/256.0, green: 154.0/256.0, blue: 154.0/256.0, alpha: 0.7), for: .normal)
      //  button_audio.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        button_audio.setImage(UIImage.init(named: "Back Icon"), for: UIControlState.normal)
        self.view.addSubview(button_audio)
        
        tableview_Dictatereport = UITableView()
        tableview_Dictatereport.backgroundColor = UIColor.clear
        tableview_Dictatereport.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height-64);
        tableview_Dictatereport.dataSource    =   self
        tableview_Dictatereport.delegate      =   self
        tableview_Dictatereport.register(UINib(nibName: "DictateReportTableViewCell", bundle: nil), forCellReuseIdentifier: "dictatereportcell")
        self.view.addSubview(tableview_Dictatereport)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Tableview Delegate Methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dictatereportcell") as! DictateReportTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.backgroundColor  = UIColor.clear
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        // let view_nonne = UIView()
        
        
        let view_footer = UIView()
        view_footer.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 60)
        var btn_view : UIButton!
        btn_view = UIButton(type: .custom)
        btn_view.frame = CGRect(x:UIScreen.main.bounds.size.width/2-30, y:0, width:60, height:60)
        btn_view.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_view.setImage(UIImage.init(named: "record"), for: UIControlState.normal)
        btn_view.addTarget(self, action: #selector(action_record), for: .touchUpInside)
        view_footer.addSubview(btn_view)
        
        return view_footer
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    @objc func action_record(){
        
        
        
        
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
