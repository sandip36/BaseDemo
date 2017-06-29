//
//  UserData.swift
//  MyBenefits
//
//  Created by Application support on 22/05/17.
//  Copyright © 2017 SandipJAdhav. All rights reserved.
//

import UIKit


extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
class UserData: NSObject {
    
    
    
    
    //MARK:- Existing File Path
    class func filePath() -> String {
      let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        
        let documentDirectory = paths[0] as! String
        
        let path = documentDirectory.appending("UserData.plist")

        let fileManager = FileManager.default
        
        
         if(!fileManager.fileExists(atPath: path))
         {
          do{
        
        let bundlePath = Bundle.main.path(forResource: "UserData", ofType: "plist")
           try fileManager.copyItem(atPath: bundlePath!, toPath: path)
        }catch{
            print("copy failure.")
        }
        }
        return path

    }
    
    
    
    
    
    
    //MARK:- Save Plist Data
    
    class func saveUserDict(_ fromServiceDict: [String: Any])
    
    {
               do {
            let data = try? JSONSerialization.data(withJSONObject: fromServiceDict, options: .prettyPrinted)
            
        
            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
        
            let plistDict = NSMutableDictionary(contentsOfFile: self.filePath())
           
            let userDict = json?["data"] as! NSDictionary
            
            
            print("userDictionary print\(userDict)")
            
                plistDict?["Employeeid"] = userDict.value(forKey: "Employeeid")
                
                plistDict?["Employeesrno"] =   userDict.value(forKey: "Employeesrno")
                
                plistDict?["Gender"] = userDict.value(forKey: "Gender")

                plistDict?["Groupchildsrno"] = userDict.value(forKey: "Groupchildsrno")
                
                plistDict?["Groupcode"] = userDict.value(forKey: "Groupcode")
                
                plistDict?["Inscoformname"] =   userDict.value(forKey: "Inscoformname")
                
                plistDict?["MobileNo"] = userDict.value(forKey: "MobileNo")
                
                plistDict?["Oegrpbasinfsrno"] = userDict.value(forKey: "Oegrpbasinfsrno")
           
                plistDict?["Policyno"] = userDict.value(forKey: "Policyno")
            
            plistDict?["Policycommdt"] =   userDict.value(forKey: "Policycommdt")
            
            plistDict?["Policyvalidupto"] = userDict.value(forKey: "Policyvalidupto")
            
            plistDict?["Tpacode"] = userDict.value(forKey: "Tpacode")
            
            plistDict?["UserName"] = userDict.value(forKey: "UserName")
            
            plistDict?.write(toFile: self.filePath(), atomically: true)
             
         
        } catch
        {
            print(error.localizedDescription)
        }
    }
     //MARK:- getting values of
        static func getEmployeeid() -> String
        {
            let dictRoot = NSDictionary(contentsOfFile: self.filePath())

            return dictRoot!.value(forKey: "Employeeid") as! String
        }
    
    //MARK:- getting values of
    
    static func getEmployeesrno() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Employeesrno") as! String
    }
    
     //MARK:- getting values of
    static func getPolicyno() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Policyno") as! String
    }
     //MARK:- getting values of
    static func getGender() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Gender") as! String
    }
     //MARK:- getting values of
    static func getUserName() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "UserName") as! String
    }
     //MARK:- getting values of
    static func getTpacode() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Tpacode") as! String
    }
     //MARK:- getting values of
    static func getPolicyvalidupto() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Policyvalidupto") as! String
    }
     //MARK:- getting values of
    static func getPolicycommdt() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Policycommdt") as! String
    }
     //MARK:- getting values of
    static func getOegrpbasinfsrno() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Oegrpbasinfsrno") as! String
    }
     //MARK:- getting values of
    static func getMobileNo() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "MobileNo") as! String
    }
     //MARK:- getting values of
    static func getInscoformname() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Inscoformname") as! String
    }
     //MARK:- getting values of
    static func getGroupcode() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Groupcode") as! String
    }
     //MARK:- getting values of
    static func getGroupchildsrno() -> String
    {
        let dictRoot = NSDictionary(contentsOfFile: self.filePath())
        
        return dictRoot!.value(forKey: "Groupchildsrno") as! String
    }
    
    
    
    
}
