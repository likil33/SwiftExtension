

import Foundation
import UIKit

extension UITableViewCell {
    func setTopCorners() -> CAShapeLayer {
        let maskPathTop = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10.0, height: 10.0))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = maskPathTop.cgPath
        return shapeLayer
    }
    
    func setBottomCorners() -> CAShapeLayer {
        let maskPathBottom = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight ], cornerRadii: CGSize(width: 10.0, height: 50.0))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = maskPathBottom.cgPath
        return shapeLayer
    }
    
    func setAllCorners() -> CAShapeLayer {
        let maskPathAll = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight, .bottomRight, .bottomLeft], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        print(shapeLayer.frame)
        shapeLayer.path = maskPathAll.cgPath
        print(shapeLayer.path!)
        return shapeLayer
    }
}

extension UITableViewCell {
    
    /// Reuse Identifier String
    public class var reuseIdentifier: String {
        return "\(self.self)"
    }
    
    /// Registers the Nib with the provided table
    public static func registerWithTable(_ table: UITableView) {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: self.reuseIdentifier , bundle: bundle)
        table.register(nib, forCellReuseIdentifier: self.reuseIdentifier)
    }
}

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension UITableView {
    // Safely dequeue a `Reusable` item
    func dequeueReusable<T: Reusable>(_ cellClass: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as? T else {
            fatalError("Misconfigured cell type, \(cellClass)!")
        }
        return cell
    }
    
    // Safely dequeue a `Reusable` item for a given index path
    func dequeueReusable<T: Reusable>(_ cellClass: T.Type, forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Misconfigured cell type, \(cellClass)!")
        }
        return cell
    }
}


public extension UITableView {
    func register(cellType: UITableViewCell.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    func register(cellTypes: [UITableViewCell.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    func dequeueReusableTCell<T: UITableViewCell>(with type: T.Type) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className) as! T
    }

    // Indexpath
    func dequeueReusableTCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}



