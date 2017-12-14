//
//  SurvellianceVideoViewController.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 12/13/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class SurvellianceVideoViewController: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    var collcetionview_Survelliance : UICollectionView!
    
    
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
        label_title.text = "SurvellianceVideoVC"
        self.navigationItem.titleView = label_title
        
        createviews()
        
        // Do any additional setup after loading the view.
    }

    func createviews(){
        
        
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width/2-10, height: 160)
        collcetionview_Survelliance = UICollectionView(frame: CGRect(x:5, y:5, width:UIScreen.main.bounds.size.width - 10, height:UIScreen.main.bounds.size.height-64 - 10), collectionViewLayout: layout)
        
        
        collcetionview_Survelliance.backgroundColor = UIColor.clear
       // collcetionview_Survelliance.frame = CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height-64);

        collcetionview_Survelliance.dataSource    =   self
        collcetionview_Survelliance.delegate      =   self
       // collcetionview_Survelliance.register(UINib(nibName: "SurvellianceCollectionViewCell", bundle: nil), forCellReuseIdentifier: "survelliancecell")
       // collcetionview_Survelliance.register(SurvellianceCollectionViewCell.self, forCellWithReuseIdentifier: "survelliancecell")
        collcetionview_Survelliance.register(UINib(nibName: "SurvellianceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "survelliancecell")
        self.view.addSubview(collcetionview_Survelliance)

        
        let footerView = UIView()
        footerView.frame = CGRect(x:0, y: self.view.frame.size.height-60, width: UIScreen.main.bounds.size.width, height: 60)
        var btn_view : UIButton!
        btn_view = UIButton(type: .custom)
        btn_view.frame = CGRect(x:UIScreen.main.bounds.size.width - 70, y:0, width:60, height:60)
        btn_view.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
        btn_view.setImage(UIImage.init(named: "add"), for: UIControlState.normal)
        btn_view.addTarget(self, action: #selector(action_plus), for: .touchUpInside)
        footerView.addSubview(btn_view)
        self.view.addSubview(footerView)
        
    }
    
    override func updateFramesForOrientation() {
        
        
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "survelliancecell", for: indexPath) as! SurvellianceCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.imageview_Survelliance?.image = UIImage(named: "test")
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
            
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            footerView.frame = CGRect(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 60)
            var btn_view : UIButton!
            btn_view = UIButton(type: .custom)
            btn_view.frame = CGRect(x:UIScreen.main.bounds.size.width - 70, y:0, width:60, height:60)
            btn_view.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 18.0)
            btn_view.setImage(UIImage.init(named: "add"), for: UIControlState.normal)
            btn_view.addTarget(self, action: #selector(action_plus), for: .touchUpInside)
            footerView.addSubview(btn_view)
            footerView.backgroundColor = UIColor.green;
            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    @objc func action_plus(){
        
        
        
        
        
        
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
