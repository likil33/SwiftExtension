/*

import Foundation
import UIKit



struct CountryCodeStruct {
    var body:[CountryCodeDataStruct]
    var httpStatusCode:Int
    
    init(with Dic:[String:Any]?) {
        let bodyArr =  Dic?["result"] as? [[String:Any]] ?? []
        self.body =  bodyArr.compactMap { (v: [String:Any]) -> CountryCodeDataStruct? in
            if v.count != 0 {return CountryCodeDataStruct(with: v) } else {return nil }
        }
        self.httpStatusCode = Dic?["httpStatusCode"] as? Int ?? 0
    }
}




struct CountryCodeDataStruct {
    
    var id:Int
    var country_name:String
    var iso_code:String
    var country_code:String
    var flag:String
    
    init(with Dic:[String:Any]?) {
        self.id = Dic?["id"] as? Int ?? 0
        self.country_name = Dic?["country_name"] as? String ?? ""
        self.iso_code = Dic?["iso_code"] as? String ?? ""
        self.country_code = Dic?["country_code"] as? String ?? ""
        self.flag = Dic?["flag"] as? String ?? ""
    }
}

struct OTPStruct {
    var body:OTPDataStruct
    var httpStatusCode:Int
    
    init(with Dic:[String:Any]?) {
        self.body = OTPDataStruct(with: Dic?["result"] as? [String:Any] ?? [:])
        self.httpStatusCode = Dic?["httpStatusCode"] as? Int ?? 0
    }
}
struct OTPDataStruct {
    var token:TokenDateStruct
    var user:UserDataStruct
    init(with Dic:[String:Any]?) {
        self.token = TokenDateStruct(with: Dic?["token"] as? [String:Any] ?? [:])
        self.user = UserDataStruct(with: Dic?["user"] as? [String:Any] ?? [:])
    }
}
struct TokenDateStruct
{
    var access:AccessTokenData
    var refreshToken: RefreshTokenData
    init(with Dic:[String:Any]?) {
        self.access = AccessTokenData(with: Dic?["access"] as? [String:Any] ?? [:])
        self.refreshToken = RefreshTokenData(with: Dic?["refresh"] as? [String:Any] ?? [:])
    }
}
struct AccessTokenData {
    var token:String
    init(with Dic:[String:Any]?) {
        self.token = Dic?["token"] as? String ?? ""
    }
}

struct RefreshTokenData {
    var token:String
    init(with Dic:[String:Any]?) {
        self.token = Dic?["token"] as? String ?? ""
    }
}


struct  UserDataStruct
{
    var id:Int
    var mobile_numberl:String
    var country_id:Int
    var user_name:String
    var email:String
    var is_active:Int
    init(with Dic:[String:Any]?) {
        self.id = Dic?["id"] as? Int ?? 0
        self.mobile_numberl = Dic?["mobile_numberl"] as? String ?? ""
        self.country_id = Dic?["country_id"] as? Int ?? 0
        self.user_name = Dic?["user_name"] as? String ?? ""
        self.email = Dic?["email"] as? String ?? ""
        self.is_active = Dic?["is_active"] as? Int ?? 0
    }
}





struct RefreshTokenStruct {
    var result:TokenDateStruct
    var httpStatusCode:Int
    
    init(with Dic:[String:Any]?) {
        self.result = TokenDateStruct(with: Dic?["result"] as? [String:Any] ?? [:])
        self.httpStatusCode = Dic?["httpStatusCode"] as? Int ?? 0
    }
}
*/




/*
 
 
 struct ProfileDataStruct {
     var body:ResultStruct
     var httpStatusCode:Int
     
     init(with Dic:[String:Any]?) {
         self.body = ResultStruct(with: Dic?["result"] as? [String:Any] ?? [:])
         self.httpStatusCode = Dic?["httpStatusCode"] as? Int ?? 0
     }
 }
 struct ResultStruct {
     var user:UserDataValueStrcut
     var zodiac_sign_list:[ZodiaSignArrDataStruct]
     
     init(with Dic:[String:Any]?) {
         self.user = UserDataValueStrcut(with: Dic?["user"] as? [String:Any] ?? [:])
         let bodyArr =  Dic?["zodiac_sign_list"] as? [[String:Any]] ?? []
         self.zodiac_sign_list =  bodyArr.compactMap { (v: [String:Any]) -> ZodiaSignArrDataStruct? in
             if v.count != 0 {return ZodiaSignArrDataStruct(with: v) } else {return nil }
         }
     }
 }
 struct UserDataValueStrcut
 {
     var id:Int
     var mobile_number:String
     var country_id:Int
     var user_name:String
     var email:String
     var height:String
     var about_yourself:String
     var dob:String
     var referral_code:String
     var relation_id:Int
     var userProfilePercentage:Int
     var zodiac_id:Int
     var drink_id:Int
     
     
     //gender
     var gender:GenderDataStruct
     init(with Dic:[String:Any]?) {
         self.id = Dic?["id"] as? Int ?? 0
         self.mobile_number = Dic?["mobile_number"] as? String ?? ""
         self.country_id = Dic?["country_id"] as? Int ?? 0
         self.user_name = Dic?["user_name"] as? String ?? ""
         self.email = Dic?["email"] as? String ?? ""
         self.height = Dic?["height"] as? String ?? ""
         self.about_yourself = Dic?["about_yourself"] as? String ?? ""
         self.dob = Dic?["dob"] as? String ?? ""
         self.referral_code = Dic?["referral_code"] as? String ?? ""
         self.relation_id = Dic?["relation_id"] as? Int ?? 0
         self.userProfilePercentage = Dic?["userProfilePercentage"] as? Int ?? 0
         self.zodiac_id = Dic?["zodiac_id"] as? Int ?? 0
         self.drink_id = Dic?["drink_id"] as? Int ?? 0
         self.gender = GenderDataStruct(with: Dic?["gender"] as? [String:Any] ?? [:])
     }
 }
 struct GenderDataStruct
 {
     var id:Int
     var gender_name:String
     init(with Dic:[String:Any]?) {
         self.id = Dic?["id"] as? Int ?? 0
         self.gender_name = Dic?["gender_name"] as? String ?? ""
     }
 }
 struct ZodiaSignArrDataStruct
 {
     var id:Int
     var name:String
     var image:String
     var min_date:String
     var max_date:String
     
     init(with Dic:[String:Any]?) {
         self.id = Dic?["id"] as? Int ?? 0
         self.name = Dic?["name"] as? String ?? ""
         self.image = Dic?["image"] as? String ?? ""
         self.min_date = Dic?["min_date"] as? String ?? ""
         self.max_date = Dic?["max_date"] as? String ?? ""
     }
 }

 */



//USES
/*
 func countrcodeListAPI()
 {
//        self.startAnimation()
     Requester.sharedHelper()?.callWebService(withURL: "\(APPURL.countryCodeList)", withMethod: httpMethod.kGet, withParams: [:], isToken: true, isSecurity: false, showLoader: false, errorAlert: false, withCompletionHandler: { (getResult, status, message, httpcode) in
         
//            self.stopAnimation()
         if httpcode == 200 {
             let result = CountryCodeStruct.init(with: getResult)
             self.countryCodeArr = result.body
         }
     })
 }
 */
