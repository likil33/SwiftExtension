

import Foundation


extension UserDefaults {
    
    
    var loginUserId:String?{
        get{return string(forKey:"user_id")}
        set{  set(newValue, forKey: "user_id")
            synchronize()
        }
    }
    
    var userCountryCode:Int?{
        get{return integer(forKey: "countrycode")}
        set{  set(newValue, forKey: "countrycode")
            synchronize()
        }
    }
    
    var loginTokenAccress:String?{
        get{
            return string(forKey: "token")
        }
        set{
            set(newValue, forKey: "token")
            synchronize()
        }
    }
    var loginTokenRefresh:String?{
        get{
            return string(forKey: "loginTokenRefresh")
        }
        set{
            set(newValue, forKey: "loginTokenRefresh")
            synchronize()
        }
    }

    var loginUserInfo:[String:Any]?{
        get{
            return dictionary(forKey: "userinformation")
        }
        set{
            set(newValue, forKey: "userinformation")
            synchronize()
        }
    }


    var userName:String?{
        get{
            return string(forKey: "userName")
        }
        set{
            set(newValue, forKey: "userName")
            synchronize()
        }
    }

    var userEmail:String?{
        get{
            return string(forKey: "userEmail")
        }
        set{
            set(newValue, forKey: "userEmail")
            synchronize()
        }
    }
    var profileImage:String?{
        get{
            return string(forKey: "profileImage")
        }
        set{
            set(newValue, forKey: "profileImage")
            synchronize()
        }
    }

//    var isLogIn:Bool?{
//        get{return bool(forKey: Key.UserDefaults.k_isLogin)}
//        set{  set(newValue, forKey: Key.UserDefaults.k_isLogin)
//            synchronize()
//        }
//    }


    var isDeviceID:String?{
        get{return string(forKey: "DeviceID")}
        set{  set(newValue, forKey: "DeviceID")
            synchronize()
        }
    }
    var mobileNo:String?{
        get{return string(forKey: "mobile")}
        set{  set(newValue, forKey: "mobile")
            synchronize()
        }
    }

    var IDVerified:Int?{
        get{return integer(forKey: "is_id_verified")}
        set{  set(newValue, forKey: "is_id_verified")
            synchronize()
        }
    }


    var isFireBaseToken:String?{
        get{return string(forKey: "isFireBaseToken")}
        set{  set(newValue, forKey: "isFireBaseToken")
            synchronize()
        }
    }


//    var isVerifyToastStatus:Bool?{
//        get{return bool(forKey:"toastStatus")}
//        set{  set(newValue, forKey: "toastStatus")
//            synchronize()
//        }
//    }



}

