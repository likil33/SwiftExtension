
import Foundation
import UIKit


//MARK:- Constant variable


let APP_NAME = ""

let APP_COLOR = UIColor.init(hex: "#FD612B")
let DESCRIPTION_COLOR = UIColor.init(hex: "#777777")
let TEXTHEADER_COLOR = UIColor.init(hex: "#222222")
let GET_ACTIVE_COLOR = UIColor.init(hex: "#202428")
let GETCOLOR = UIColor.init(hex: "#202428")



//MARK:- UI element and static vairable
let MainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
let HomeStoryBoard:UIStoryboard = UIStoryboard(name: "Home", bundle: Bundle.main)
let MoreStoryBoard:UIStoryboard = UIStoryboard(name: "More", bundle: Bundle.main)
let TabbarStoryBoard:UIStoryboard = UIStoryboard(name: "TabBar", bundle: Bundle.main)

//MARK:- Navifation bar prperity 
let window1 = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

let NavStatusheight = window1?.windowScene?.statusBarManager?.statusBarFrame.height ?? 20
let NavHeight = NavStatusheight +
    (UINavigationController().navigationBar.frame.height)
let NavBarHeight = UINavigationController().navigationBar.frame.height

let PhoneScreenSize: CGRect = UIScreen.main.bounds


//MARK:- Constant function

class Constant {
    
   
    static func localizedString(_ txt: String) -> String{
        return NSLocalizedString(txt, comment:txt)
    }
    
    static func loadImage(imageStr:String,placeHolder:UIImage) -> UIImage {
        var image = UIImage()
        //         DispatchQueue.global(qos: .background).async {
        guard let url = URL(string: imageStr) else {return placeHolder}
        let data = try? Data(contentsOf: url)
        if let imageData = data {
            image = UIImage(data: imageData) ?? placeHolder
        }
        
        return image
    }
    
    func downloadFromURL(urlString:String, callback:((_ image:UIImage?, _ error: Error?)->Void)?)   {
        var image: UIImage?
        guard let url = URL(string: urlString) else { return callback!(UIImage(),nil)}
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try Data(contentsOf: url)
                image = UIImage(data: data)
                DispatchQueue.main.async {
                    callback!(image,nil)
                    return
                }
                
            } catch {
                callback!(nil, error.localizedDescription as? Error)
                return
                
            }
        }
    }
    
    //MARK:- Date Format
    static func getFormattedStringDate(_ string: String, inputformat: String, outputformat: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputformat
        
        if let formatDate = dateFormatter.date(from:string) {
            dateFormatter.dateFormat = outputformat
            return dateFormatter.string(from: formatDate)
        } else {
            // invalid format
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let formatDate1 = dateFormatter.date(from:string)
            dateFormatter.dateFormat = outputformat
            return dateFormatter.string(from: formatDate1 ?? Date())
        }
    }
    
    //MARK: - validation Email
    static func isValidEmail(testStr:String) -> Bool {
        /*
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
         let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return emailTest.evaluate(with: testStr)
         */
        let emailRegEx = "[A-Z0-9a-z.]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //MARK: - validate Mobile Number
    static func isValidPhoneNumber(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    
    static func getCurrentTimeStamp() -> String {
        let currentDate = Date()
        // 1) Create a DateFormatter() object.
        let format = DateFormatter()
        // 2) Set the current timezone to .current, or America/Chicago.
        format.timeZone = .current
        // 3) Set the format of the altered date.
        format.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.ssssss-05:00"
        //"yyyy-MM-dd'T'hh:mm:ss.sssZ[+|-]hh:mm:ss"
        //"yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        //"yyyy-MM-dd'T'HH:mm:ssZ"
        // 4) Set the current date, altered by timezone.
        let dateString = format.string(from: currentDate)
        return dateString
    }
    
    static func getTodayDate() -> String {
        let currentDate = Date()
        // 1) Create a DateFormatter() object.
        let format = DateFormatter()
        // 2) Set the current timezone to .current, or America/Chicago.
        format.timeZone = .current
        // 3) Set the format of the altered date.
        format.dateFormat = "yyyy-MM-dd"
        let dateString = format.string(from: currentDate)
        return dateString
    }
    
    static func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }

        return nil
    }
    
   
    
    
}
func vsprint(_ msg: Any) {
    #if DEBUG
    print(msg)
    #endif
}

//MARK:- Color hex extention
extension UIColor {
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha:1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = String(hex.dropFirst())
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt64 = 0x0
        scanner.scanHexInt64(&hexInt)
        
        var r:UInt64!, g:UInt64!, b:UInt64!
        switch (hexWithoutSymbol.count) {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
            g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
            b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
            break;
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xff
            g = (hexInt >> 8) & 0xff
            b = hexInt & 0xff
            break;
        default:
            // TODO:ERROR
            break;
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
}
