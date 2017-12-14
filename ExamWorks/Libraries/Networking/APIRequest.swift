//
//  APIRequest.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 26/11/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


protocol APIRequestDelegate {
    
    func requestFinished(request: APIRequest)
    func requestFailed(request: APIRequest, withError:Error)

}


class APIRequest: NSObject {
    
    // MARK: API Variables initialization
    
    var dictionary_Response:[String:AnyObject]!
    var apiRequestDelegate: APIRequestDelegate?

    
    
    // MARK: API Versions
    let VER_LOGIN = "1"
    let VER_SIGNUP = "1"
    
    var apiUrl:[AnyHashable:String]!
    var apiMethod:[AnyHashable:AnyHashable]!
    var headersDictionary:[AnyHashable:String]!
    var parametersDictionary:[AnyHashable:String]!
    
    var apiKeyForRequestIs:APIKey!
    
    // MARK: API keys
    
    public enum APIKey {
        case API_LOGIN 
        case API_SIGNUP
        case API_COUNT
        case API_DASHBOARD_AWAITINGREPORTDICTATION
        case API_DASHBOARD_AWAITINGREPORTAPPROVAL
        case API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION
        case API_DASHBOARD_MEDICALRECOEDSADDED
        case API_DASHBOARD_PENDINGPAYMENTS
        case API_DASHBOARD_CURRENTMONTHCUMULATIVES
        case API_DASHBOARD_AWAITINGREPORTDICTATION_DETAIL
        case API_DASHBOARD_AWAITINGREPORTAPPROVAL_DETAIL
        case API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION_DETAIL
        case API_DASHBOARD_PENDINGPAYMENTS_DETAIL
        case API_DASHBOARD_CURRENTMONTHCUMULATIVES_DETAIL
        case API_DASHBOARD_CASEDETAIL
        case API_DASHBOARD_RECORDSADDEDDETAILGRID
        case API_UPLOADDOCUMENT
        case API_DOCTORSCHEDULE
        case API_DOCTORDAILYSCHEDULE


    }
    
    // AwaitingReportApproval

    //MARK: Retrieval methods for URLs, Parameters, Request Type, Version, APIIndex
    

    
    public func initialiseRequestAttributes() {
        
        apiUrl = Dictionary()
        apiMethod = Dictionary()
        headersDictionary = Dictionary()
        parametersDictionary = Dictionary()

        
        apiUrl[APIKey.API_LOGIN] = "security/login"
        apiMethod[APIKey.API_LOGIN] = HTTPMethod.post.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION] = "Dashboard/AwaitingReportDictation"
        apiMethod[APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_AWAITINGREPORTAPPROVAL] = "Dashboard/AwaitingReportApproval"
        apiMethod[APIKey.API_DASHBOARD_AWAITINGREPORTAPPROVAL] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION] = "Dashboard/AwaitingDaysheetConfirmation"
        apiMethod[APIKey.API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_MEDICALRECOEDSADDED] = "Dashboard/MedicalRecordsAdded"
        apiMethod[APIKey.API_DASHBOARD_MEDICALRECOEDSADDED] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_PENDINGPAYMENTS] = "Dashboard/PendingPayments"
        apiMethod[APIKey.API_DASHBOARD_PENDINGPAYMENTS] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_CURRENTMONTHCUMULATIVES] = "Dashboard/CurrentMonthCumulativeCases"
        apiMethod[APIKey.API_DASHBOARD_CURRENTMONTHCUMULATIVES] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION_DETAIL] = "Dashboard/AwaitingReportDictationDetailGrid"
        apiMethod[APIKey.API_DASHBOARD_AWAITINGREPORTDICTATION_DETAIL] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DASHBOARD_CASEDETAIL] = "Case/20175237"
        apiMethod[APIKey.API_DASHBOARD_CASEDETAIL] = HTTPMethod.get.rawValue

        apiUrl[APIKey.API_DASHBOARD_MEDICALRECOEDSADDED] = "Dashboard/MedicalRecordsAdded"
        apiMethod[APIKey.API_DASHBOARD_MEDICALRECOEDSADDED] = HTTPMethod.get.rawValue

        apiUrl[APIKey.API_DASHBOARD_RECORDSADDEDDETAILGRID] = "Dashboard/MedicalRecordsAddedDetailGrid"
        apiMethod[APIKey.API_DASHBOARD_RECORDSADDEDDETAILGRID] = HTTPMethod.get.rawValue

        
        apiUrl[APIKey.API_DASHBOARD_AWAITINGREPORTAPPROVAL_DETAIL] = "Dashboard/AwaitingReportApprovalDetailGrid"
        apiMethod[APIKey.API_DASHBOARD_AWAITINGREPORTAPPROVAL_DETAIL] = HTTPMethod.get.rawValue

        apiUrl[APIKey.API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION_DETAIL] = "Dashboard/AwaitingDaysheetConfirmationDetailGrid"
        apiMethod[APIKey.API_DASHBOARD_AWAITINGAPPTATTCONFIRMATION_DETAIL] = HTTPMethod.get.rawValue

        apiUrl[APIKey.API_DASHBOARD_PENDINGPAYMENTS_DETAIL] = "Dashboard/PendingPaymentsDetailGrid"
        apiMethod[APIKey.API_DASHBOARD_PENDINGPAYMENTS_DETAIL] = HTTPMethod.get.rawValue

        apiUrl[APIKey.API_DASHBOARD_CURRENTMONTHCUMULATIVES_DETAIL] = "Dashboard/CurrentMonthCumulativeCasesDetailGrid"
        apiMethod[APIKey.API_DASHBOARD_CURRENTMONTHCUMULATIVES_DETAIL] = HTTPMethod.get.rawValue

        apiUrl[APIKey.API_DOCTORSCHEDULE] = "Dashboard/DoctorSchedule"
        apiMethod[APIKey.API_DOCTORSCHEDULE] = HTTPMethod.get.rawValue
        
        apiUrl[APIKey.API_DOCTORDAILYSCHEDULE] = "Dashboard/DoctorDailySchedule?"
        apiMethod[APIKey.API_DOCTORDAILYSCHEDULE] = HTTPMethod.get.rawValue

        apiUrl[APIKey.API_UPLOADDOCUMENT] = "Case/20324951/Document"
        apiMethod[APIKey.API_UPLOADDOCUMENT] = HTTPMethod.post.rawValue

        
    }
    
    //MARK Invoke APIRequest
    
    
    public func requestWithKey(apiKey: APIKey) -> APIRequest {
      return self.initWith(apiKey: apiKey)
    }
    
    func initWith(apiKey: APIKey) -> APIRequest {
        
        self.initialiseRequestAttributes()
        apiKeyForRequestIs = apiKey
        
        return self
       
    }
    
    
    func invokeWith(parameters: Dictionary<AnyHashable,String>?, headers: Dictionary<AnyHashable,String>?) {
        
        parametersDictionary = parameters
        headersDictionary = headers
        
        
        let httpMethodRawValue = apiMethod[apiKeyForRequestIs] as? String
        
        let httpMethodActualValue = HTTPMethod(rawValue: httpMethodRawValue!)
        
        
        Alamofire.request(String(format: "%@%@", Constants.Constants.APP_BASE_URL,apiUrl[apiKeyForRequestIs] as String!), method: httpMethodActualValue!, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: headers as? HTTPHeaders).responseJSON { (responseData) -> Void in

            
            if responseData.error != nil {
                print("We got an error")
                
                self.apiRequestDelegate?.requestFailed(request: self, withError: responseData.error!)
            }
            else {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                self.dictionary_Response = Dictionary<String,AnyObject>()
                
//                self.dictionary_Response["response"] = swiftyJsonVar as AnyObject
                

                
                if swiftyJsonVar.dictionary != nil {
                    print("Response is dictionary with object\(swiftyJsonVar.dictionary)")
                    self.dictionary_Response = swiftyJsonVar.dictionaryObject as! [String:AnyObject]

                }
                if swiftyJsonVar.array != nil {
                    print("Response is array with object\(swiftyJsonVar.array)")
                    
                    self.dictionary_Response = ["response":swiftyJsonVar.arrayObject as AnyObject]
                }
                else {
                    print("Response is String with value \(swiftyJsonVar.stringValue)")
                }
                
                self.apiRequestDelegate?.requestFinished(request: self)

                
            }
            
        }
    }
    
}
