//
//  Util.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 10/12/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    public func storeUserDefaults(withObject: Any, andKey: String) {
        UserDefaults.standard.set(withObject, forKey: andKey)
        UserDefaults.standard.synchronize()
    }
    
    public func getUserDefaultsValue(withKey: String) {
        UserDefaults.standard.object(forKey: withKey)
    }

}
