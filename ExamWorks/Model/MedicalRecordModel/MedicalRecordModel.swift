//
//  MedicalRecordModel.swift
//  ExamWorks
//
//  Created by Saven Developer on 12/4/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit

class MedicalRecordModel: NSObject {
    
    var str_Description:String!
    var str_Date:String!
    var str_CaseNbr:String!
    var str_examinee:String!
    var str_fileName:String!
    var str_claimNbr:String!
    
    class func getMedicalRecordObjectForDictionary(dict_MedicalModel:Dictionary<String,String>) -> MedicalRecordModel {
        
        let object_MedicalRecordModel = MedicalRecordModel()
        object_MedicalRecordModel.str_Description = dict_MedicalModel["description"]
        object_MedicalRecordModel.str_Date = dict_MedicalModel["date"]
        object_MedicalRecordModel.str_CaseNbr = dict_MedicalModel["caseNbr"]
        object_MedicalRecordModel.str_examinee = dict_MedicalModel["exmainee"]
        object_MedicalRecordModel.str_fileName = dict_MedicalModel["fileName"]
        object_MedicalRecordModel.str_claimNbr = dict_MedicalModel["claimNbr"]
        
        return object_MedicalRecordModel
    }

}
