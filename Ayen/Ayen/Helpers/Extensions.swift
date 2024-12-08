import UIKit

extension CALayer {
    func applyShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        self.shadowColor = color.cgColor
        self.shadowOffset = offset
        self.shadowOpacity = opacity
        self.shadowRadius = radius
    }
}


extension UIColor {
    convenience init(named hex: String) {
        let hexSanitized = hex.replacingOccurrences(of: "#", with: "")
        
        if hexSanitized.count == 6 {
            let scanner = Scanner(string: hexSanitized)
            var rgb: UInt64 = 0
            scanner.scanHexInt64(&rgb)
            
            let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(rgb & 0x0000FF) / 255.0
            
            self.init(red: r, green: g, blue: b, alpha: 1.0)
        } else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        }
    }
    
}

extension UILabel {
    func addTapGesture(target: Any, action: Selector) {
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
}
