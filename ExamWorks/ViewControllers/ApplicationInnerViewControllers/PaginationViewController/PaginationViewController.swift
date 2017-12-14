//
//  PaginationViewController.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 25/11/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class PaginationViewController: BaseViewController, SlidingContainerViewControllerDelegate {
    
   
    var slidingContainerViewController:SlidingContainerViewController!
    
    var vc_Home:HomeViewController!
    var vc_Schedules:SchedulesViewController!
    var vc_Profile:ProfileViewController!
    var vc_Notifications:NotificationsViewController!
    var vc_Analytics:AnalyticsViewController!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        
        self.createTabBarViewControllers()
        
        self.createHeaderView(withBackgroundcolor: Constants.Constants.COLOR_APPTHEME, leftView: nil, rightView: nil, isText: true, isImage: false, title: "Dashboard", image: nil)
        
        
        slidingContainerViewController = SlidingContainerViewController (
            parent: self,
            contentViewControllers: [vc_Home, vc_Schedules, vc_Profile, vc_Notifications, vc_Analytics],
            titles: ["Home", "Schedules", "Profile", "Notifications", "Analytics"])

        view.addSubview(slidingContainerViewController.view)
        
        slidingContainerViewController.sliderView.appearance.outerPadding = 0
        slidingContainerViewController.sliderView.appearance.innerPadding = 50
        slidingContainerViewController.sliderView.appearance.fixedWidth = true
        slidingContainerViewController.setCurrentViewControllerAtIndex(0)
        slidingContainerViewController.delegate = self


        // Do any additional setup after loading the view.
    }
    
    // MARK: View Controllers Create Method
    
    func createTabBarViewControllers() {
        vc_Home = HomeViewController()
        vc_Schedules = SchedulesViewController()
        vc_Profile = ProfileViewController()
        vc_Notifications = NotificationsViewController()
        vc_Analytics = AnalyticsViewController()
    }
    
    
    // MARK: SlidingContainerViewControllerDelegate
    
    func slidingContainerViewControllerDidMoveToViewController(_ slidingContainerViewController: SlidingContainerViewController, viewController: UIViewController, atIndex: Int) {
        
    }
    
    func slidingContainerViewControllerDidShowSliderView(_ slidingContainerViewController: SlidingContainerViewController) {
        
    }
    
    func slidingContainerViewControllerDidHideSliderView(_ slidingContainerViewController: SlidingContainerViewController) {
        
    }

    override func updateFramesForOrientation() {
        print("orientation changed")
        slidingContainerViewController.view.frame = CGRect(x: slidingContainerViewController.view.frame.origin.x, y: slidingContainerViewController.view.frame.origin.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
        slidingContainerViewController.sliderView.orienationChangedUpdateFrames()
        slidingContainerViewController.updateFramesOnOrientation()
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
