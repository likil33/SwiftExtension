
import UIKit


extension String {

    func isValidPassword() -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }

}




//MARK:-
extension String
{
    func toDateString( inputDateFormat inputFormat  : String,  ouputDateFormat outputFormat  : String ) -> String   {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = outputFormat
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    func toDateStringReturnDate( inputDateFormat inputFormat  : String,  ouputDateFormat outputFormat  : String ) -> Date   {
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = inputFormat
           if let date = dateFormatter.date(from: self) {
               dateFormatter.dateFormat = outputFormat
               return  date
           }
           return Date()
       }
}

@available(iOS 13.0, *)
extension UIViewController {
    func returnAttributeStr(_ fullStr:String, _ attStr:String, _ color:UIColor = APP_COLOR) -> NSAttributedString {
        
        let rangeSignUp = NSString(string: fullStr).range(of: attStr, options: String.CompareOptions.caseInsensitive)
        let rangeFull = NSString(string: fullStr).range(of: fullStr, options: String.CompareOptions.caseInsensitive)
        let attrStr = NSMutableAttributedString.init(string:fullStr)
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.placeholderText,
                               NSAttributedString.Key.font : UIFont.init(name: "Helvetica", size: 17)! as Any],range: rangeFull)
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor : color,
                               NSAttributedString.Key.font : UIFont.init(name: "Helvetica", size: 20)!,
                               NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any],range: rangeSignUp) // for swift 4 -> Change thick to styleThick
        return attrStr
    }
    
    func createAttributedString(stringArray: [String], attributedPart: Int, attributes: [NSAttributedString.Key: Any]) -> NSMutableAttributedString? {
        let finalString = NSMutableAttributedString()
        for i in 0 ..< stringArray.count {
            var attributedString = NSMutableAttributedString(string: stringArray[i], attributes: nil)
            if i == attributedPart {
                attributedString = NSMutableAttributedString(string: attributedString.string, attributes: attributes)
                finalString.append(attributedString)
            } else {
                finalString.append(attributedString)
            }
        }
        return finalString
    }
}


extension String {
  subscript(index value: Int) -> Element {
    get {
        let i = index(startIndex, offsetBy: value)
        return self[i]
    } set {
        var array = Array(self)
        array[value] = newValue
        self = String(array)
    }
  }
}


extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}

//extension String {
//    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//
//        return ceil(boundingBox.height)
//    }
//
//    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//
//        return ceil(boundingBox.width)
//    }
//}


/*
 textView.text = yourString.html2String or

 label.text = yourString.html2String
 */
extension String {

        var html2AttributedString: NSAttributedString? {
            guard let data = data(using: .utf8) else { return nil }
            do {
                return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch let error as NSError {
                print(error.localizedDescription)
                return  nil
            }
        }
        var html2String: String {
            return html2AttributedString?.string ?? ""
        }
}

extension NSMutableAttributedString {

    var fontSize:CGFloat { return 14 }
    var boldFont:UIFont { return UIFont(name: "OpenSans-SemiBold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "OpenSans-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
  //  var smallSizeFont:UIFont { return UIFont(name: "OpenSans-Regular", size: CGFloat(7)) ?? UIFont.systemFont(ofSize: fontSize)}
   
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func boldCustomFont(_ value:String, _ fontSize:Float) -> NSMutableAttributedString {
        var customFont:UIFont { return UIFont(name: "OpenSans-SemiBold", size: CGFloat(fontSize)) ?? UIFont.systemFont(ofSize: CGFloat(fontSize))}
        
        let sapce = NSMutableParagraphStyle()
        sapce.lineSpacing = 2
        let attributes:[NSAttributedString.Key : Any] = [
            .font : customFont, .foregroundColor : UIColor.black,
            .paragraphStyle:sapce,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    func customSize(_ value:String, _ fontSize:Float, _ color:UIColor = .black) -> NSMutableAttributedString {
        var customFont:UIFont { return UIFont(name: "OpenSans-Regular", size: CGFloat(fontSize)) ?? UIFont.systemFont(ofSize: CGFloat(fontSize))}
        let attributes:[NSAttributedString.Key : Any] = [
            .font : customFont,
            .foregroundColor:color,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    
    func customSizeWithUnderLine(_ value:String, _ fontSize:Float, _ color:UIColor = .black) -> NSMutableAttributedString {
        var customFont:UIFont { return UIFont(name: "OpenSans-Regular", size: CGFloat(fontSize)) ?? UIFont.systemFont(ofSize: CGFloat(fontSize))}
        let attributes:[NSAttributedString.Key : Any] = [
            .font : customFont,
            .foregroundColor:color,
            .underlineStyle : NSUnderlineStyle.single.rawValue,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func blackHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
            
        ]
                self.append(NSAttributedString(string: value, attributes:attributes))
        return self

    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    

    
    /*
     uses
     
     let attrText = NSMutableAttributedString()
         .boldCustomFont("\(addressData.CompanyName)\n", 18)
         .customSize(addressText, 14, .darkGray)
     
     cell.descriptionLbl.attributedText = attrText
     
     
     //
     
     calling - uses
     https://stackoverflow.com/questions/28496093/making-text-bold-using-attributed-string-in-swift
     
     let label = UILabel()
     label.attributedText =
         NSMutableAttributedString()
             .bold("Address: ")
             .normal(" Kathmandu, Nepal\n\n")
             .orangeHighlight(" Email: ")
             .blackHighlight(" prajeet.shrestha@gmail.com ")
             .bold("\n\nCopyright: ")
             .underlined(" All rights reserved. 2020.")
     */
    
}

extension Constant {
    static func getSemiBoldText(_ textV:String,_ fontSize:Float) -> NSMutableAttributedString {
        let attText = NSMutableAttributedString()
            .boldCustomFont(textV, fontSize)
        return attText
    }
}


extension String {
    
    func stringDateToInt(requireFormatter: String, needFormatter: String, dateStr: String) -> Int64 {
        var dateInt: Int64 = 0
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "\(requireFormatter)"
        if let date = dateFormatter.date(from: dateStr) {
            dateFormatter.dateFormat = "\(needFormatter)"
            dateInt = date.millisecondsSince1970
//            dateInt = Int(date.timeIntervalSince1970)
        }
        return dateInt
    }
}
extension Date {
 var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
        //RESOLVED CRASH HERE
    }

    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}





extension UIColor {
    var hexString:String? {
        if let components = self.cgColor.components {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "%02X%02X%02X", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}

extension String {
    //https://valv0.medium.com/a-swift-extension-for-string-and-html-8cfb7477a510
    func formattedDate(format: String = "dd/MM/yyyy HH::mm a") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier:"UTC")
        return dateFormatter.date(from: self)
    }
    var html2Attributed: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    var htmlAttributed: (NSAttributedString?, NSDictionary?) {
        do {
            guard let data = data(using: String.Encoding.utf8) else {
                return (nil, nil)
            }

            var dict:NSDictionary?
            dict = NSMutableDictionary()

            return try (NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: &dict), dict)
        } catch {
            print("error: ", error)
            return (nil, nil)
        }
    }
    
    func htmlAttributed(using font: UIFont, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>a{color:rgb(6,69,173); text-decoration:underline}" +
                "p{font-size:12px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
                "ps{font-size:10px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
                "hub{font-size:15px; line-height: normal;" +
                " text-transform: uppercase; color:rgb(62, 61, 61); font-weight: bold;}" +
                "hu{font-size:15px; line-height: normal; text-transform: uppercase; color:rgb(62, 61, 61);}" +
                "h{font-size:15px; color:rgb(62, 61, 61); line-height: normal}" +
                "ul{padding:0px; margin:0px;}\n" +
                "ul li{padding: 0px 0 10px 0; margin:0px; font-size:12px; color:rgb(62, 61, 61);}\n" +
                "ul li span{width: 6px;height: 6px;background: rgb(62, 61, 61); display: inline-block;border-radius: 15px;margin: 0 6px 0 0;}" +
                "</style>" +
                "<body style=\"margin: 0; padding: 0\"> \(self)"

            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }

            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }

    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>a{color:rgb(6,69,173); text-decoration:underline}" +
                "p{font-family: 'Open Sans'; font-size:14px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
                "ps{font-family: 'Open Sans';font-size:10px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
                "hub{font-family: 'Open Sans';font-size:15px; line-height: normal;" +
                " text-transform: uppercase; color:rgb(62, 61, 61); font-weight: bold;}" +
                "hu{font-family: 'Open Sans';font-size:15px; line-height: normal; text-transform: uppercase; color:rgb(62, 61, 61);}" +
                "h{font-family: 'Open Sans';font-size:15px; color:rgb(62, 61, 61); line-height: normal}" +
                "ul{padding:0px; margin:0px;}\n" +
                "ul li{padding: 0px 0 10px 0; margin:7px;font-family: 'Open Sans'; font-size:14px; color:rgb(62, 61, 61);}\n" +
                "ul li span{width: 6px;height: 6px;background: rgb(62, 61, 61); display: inline-block;border-radius: 15px;margin: 0 6px 0 0;}" +
                "</style>" +
                "<body style=\"margin: 0; padding: 0\"> \(self)"

            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }

            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }

}



/*
 backup
 <style>a{color:rgb(6,69,173); text-decoration:underline}" +
     "p{font-family: 'Open Sans'; font-size:14px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
     "ps{font-family: 'Open Sans';font-size:10px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
     "hub{font-family: 'Open Sans';font-size:15px; line-height: normal;" +
     " text-transform: uppercase; color:rgb(62, 61, 61); font-weight: bold;}" +
     "hu{font-family: 'Open Sans';font-size:15px; line-height: normal; text-transform: uppercase; color:rgb(62, 61, 61);}" +
     "h{font-family: 'Open Sans';font-size:15px; color:rgb(62, 61, 61); line-height: normal}" +
     "ul{padding:0px; margin:0px;}\n" +
     "ul li{padding: 0px 0 10px 0; margin:7px;font-family: 'Open Sans'; font-size:14px; color:rgb(62, 61, 61);}\n" +
     "ul li span{width: 6px;height: 6px;background: rgb(62, 61, 61); display: inline-block;border-radius: 15px;margin: 0 6px 0 0;}" +
     "</style>" +
     "<body style=\"margin: 0; padding: 0\">
 */




/**
 changed fontfamily
 
 "<style>a{color:rgb(6,69,173); text-decoration:underline}" +
     "p{font-size:12px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
     "ps{font-size:10px; color:rgb(62, 61, 61); padding-top:5px; text-align: justify; }" +
     "hub{font-size:15px; line-height: normal;" +
     " text-transform: uppercase; color:rgb(62, 61, 61); font-weight: bold;}" +
     "hu{font-size:15px; line-height: normal; text-transform: uppercase; color:rgb(62, 61, 61);}" +
     "h{font-size:15px; color:rgb(62, 61, 61); line-height: normal}" +
     "ul{padding:0px; margin:0px;}\n" +
     "ul li{padding: 0px 0 10px 0; margin:0px; font-size:12px; color:rgb(62, 61, 61);}\n" +
     "ul li span{width: 6px;height: 6px;background: rgb(62, 61, 61); display: inline-block;border-radius: 15px;margin: 0 6px 0 0;}" +
     "</style>" +
     "<body style=\"margin: 0; padding: 0\"> \(self)"
 
 
 */

