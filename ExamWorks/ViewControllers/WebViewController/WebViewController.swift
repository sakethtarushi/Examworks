//
//  WebViewController.swift
//  ExamWorks
//
//  Created by Saven Developer on 12/4/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class WebViewController: BaseViewController,UIWebViewDelegate {

    var webview_file : UIWebView!
    var button_Cancel :  UIButton!
    var filepath_web : String!
    
    
    init(nibname: NSString, bundlepath: Bundle?, filepath: String) {

        super.init(nibName: nibname as String, bundle: bundlepath)
        filepath_web = "https://connect.vultus.com/Vultusconnect/uploads/Vultus/Documents/983VultusConnect_2911201761040.png"
        setupviewsforwebview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    func setupviewsforwebview(){
        
        webview_file = UIWebView()
        webview_file.frame = CGRect(x:0, y:60, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height-65)
        webview_file.delegate = self
        webview_file.isOpaque = false
        webview_file.scalesPageToFit = true
        webview_file.scrollView.isScrollEnabled = true
        self.view.addSubview(webview_file)
        
        button_Cancel = UIButton(type: .custom)
        button_Cancel.frame = CGRect(x:UIScreen.main.bounds.size.width - 36, y:20, width:28, height:28)
        button_Cancel.backgroundColor = Constants.Constants.COLOR_APPTHEME
        button_Cancel.layer.cornerRadius = 5.0
        button_Cancel.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        button_Cancel.setTitle("Send", for: .normal)
        button_Cancel.addTarget(self, action: #selector(action_Back), for: .touchUpInside)
        self.view.addSubview(button_Cancel)
        
    
        let urlToLoad = URL(string: filepath_web);

        var request = URLRequest(url: urlToLoad!)
        
        request.setValue((UserDefaults.standard.object(forKey: "base64") as! String), forHTTPHeaderField:"Authorization")
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")

        webview_file.loadRequest(request)
        
    }
    
    @objc func action_Back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
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
