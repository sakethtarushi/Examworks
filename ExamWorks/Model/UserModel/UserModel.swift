//
//  UserModel.swift
//  ExamWorks
//
//  Created by SAVEN TECHNOLOGIES002 on 11/29/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class UserModel: NSObject {

    var str_Email:String!
    var str_FirstName:String!
    var str_LastName:String!
    var str_SessionToken:String!
    var str_UserName:String!
    var str_UserType:String!
    
    class func getUserObjectForDictionary(dict_User:Dictionary<String,String>) -> UserModel {
        
        let object_UserModel = UserModel()
        object_UserModel.str_Email = dict_User["email"]
        object_UserModel.str_FirstName = dict_User["firstName"]
        object_UserModel.str_LastName = dict_User["lastName"]
        object_UserModel.str_SessionToken = dict_User["sessionToken"]
        object_UserModel.str_UserName = dict_User["userName"]
        object_UserModel.str_UserType = dict_User["userType"]

        return object_UserModel
    }
}
