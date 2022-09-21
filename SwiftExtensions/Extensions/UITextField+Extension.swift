

import Foundation
import UIKit

@IBDesignable
extension UITextField {

    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }

    @IBInspectable var paddingRightCustom: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 10, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
}

//
//
//extension UITextField{
//
//
//    @IBInspectable var placeHolderColor: UIColor? {
//        get {
//            return self.placeHolderColor
//        }
//        set {
//            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
//        }
//    }
//
//    @IBInspectable var leftSide:UIImage {
//        get {
//            return UIImage()
//        } set {
//            let left: UIImageView = UIImageView(frame: CGRect(x: 10.0, y: 0.0, width:35.0, height: self.frame.size.height-5))
//            left.image = newValue
//            left.contentMode = .center
//
//            leftViewMode = .always
//            self.leftView = left
//        }
//    }
//    @IBInspectable var RightSide:UIImage {
//        get {
//            return UIImage()
//        } set {
//            let Right: UIImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width:25, height: self.frame.size.height-5))
//            Right.image = newValue
//            Right.contentMode = .center
//            rightViewMode = .always
//            self.rightView = Right
//        }
//    }
//
//}



@IBDesignable
   class TextFieldWithImage: UITextField {

       override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
           return super.leftViewRect(forBounds: bounds)
       }

       @IBInspectable var leftImage: UIImage? {
           didSet {
               updateView()
           }
       }
       @IBInspectable var leftPadding: CGFloat = 0 {
           didSet {
               updateView()
           }
       }
       @IBInspectable var rightPadding: CGFloat = 0 {
           didSet {
               updateView()
           }
       }
       @IBInspectable var imageMaxHeight: CGFloat = 0 {
           didSet {
               updateView()
           }
       }

       @IBInspectable var color: UIColor = UIColor.lightGray {
           didSet {
               updateView()
           }
       }

       func updateView() {
           if let image = leftImage {
               leftViewMode = UITextField.ViewMode.always

               let containerSize = calculateContainerViewSize(for: image)
               let containerView = UIView(frame: CGRect(x: 0, y: 0, width: containerSize.width, height: containerSize.height))

               let imageView = UIImageView(frame: .zero)
               containerView.addSubview(imageView)
               setImageViewConstraints(imageView, in: containerView)

               setImageViewProperties(imageView, image: image)

               leftView = containerView
           } else {
               leftViewMode = UITextField.ViewMode.never
               leftView = nil
           }

           attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "",
                   attributes: [NSAttributedString.Key.foregroundColor: color])
       }

       private func calculateContainerViewSize(for image: UIImage) -> CGSize {
           let imageRatio = image.size.height / image.size.width
           let adjustedImageMaxHeight = imageMaxHeight > self.frame.height ? self.frame.height : imageMaxHeight

           var imageSize = CGSize()
           if image.size.height > adjustedImageMaxHeight {
               imageSize.height = adjustedImageMaxHeight
               imageSize.width = imageSize.height / imageRatio
           }

           let paddingWidth = leftPadding + rightPadding

           let containerSize = CGSize(width: imageSize.width + paddingWidth, height: imageSize.height)
           return containerSize
       }

       private func setImageViewConstraints(_ imageView: UIImageView, in containerView: UIView) {
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
           imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
           imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -rightPadding).isActive = true
           imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: leftPadding).isActive = true
       }

       private func setImageViewProperties(_ imageView: UIImageView, image: UIImage) {
           imageView.contentMode = .scaleAspectFit
           imageView.image = image
           imageView.tintColor = color
       }
 
   }



extension UITextField {

enum Direction {
    case Left
    case Right
}

// add image to textfield
func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5
    
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 5
    view.layer.borderWidth = CGFloat(0.5)
    view.layer.borderColor = colorBorder.cgColor
    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 0.0, y: 13.0, width: 18, height: 18)
    view.addSubview(imageView)

    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if(Direction.Left == direction){ // image left
        seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
        self.rightViewMode = .always
        self.rightView = mainView
    }

    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = CGFloat(0.5)
    self.layer.cornerRadius = 5
}

}
