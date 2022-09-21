
import Foundation
import UIKit

enum storyBoardName:String{
    case Main, More, Home, TabBar
    var instance:UIStoryboard{
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    func viewController<T:UIViewController>(viewControllerClass:T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyBoardID
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("ViewController \(storyboardID),not found \(self.rawValue)")
        }
        return scene
    }
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController{
    // Not using static as it wont be possible to over
    class var storyBoardID:String{
        return"\(self)"
    }
    static func instantiate(storyboardName:storyBoardName)-> Self{
        return storyboardName.viewController(viewControllerClass: self)
        
    }
}
