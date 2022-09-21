

/*
import Foundation
import UIKit
// MARK: Switcher class

enum RootVC:String {
    case LoginViewController, TabBarVC
}

class Switcher {
    static let shared = Switcher()
    private init() {}
    
    static func updateRootVC(_ rootVC:RootVC) {
        var navigationController = UINavigationController()
        if UserDefaults.standard.bool(forKey: "KLogin") == false {
            guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                return
            }
            navigationController = UINavigationController(rootViewController: rootVC)
        } else if rootVC == .TabBarVC {
            guard let rootVC = UIStoryboard.init(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC else {
                return
            }
            navigationController = UINavigationController(rootViewController: rootVC)
        }
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func resetRoot() {
        
        var navigationController = UINavigationController()
        if UserDefaults.standard.bool(forKey: "KLogin") == true {
            guard let rootVC = UIStoryboard.init(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC else {
                return
            }
             navigationController = UINavigationController(rootViewController: rootVC)

        }else{
            guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
                return
            }
             navigationController = UINavigationController(rootViewController: rootVC)

        }
        
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
 
}

*/
