//
//  UIFont+Extension.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 18/10/23.
//

import UIKit

extension UIFont {
    
    enum FontStyle {
        case regular
        case bold
        case light
        
        func getFontName() -> String {
            switch self {
            case .regular:
                return "SFProDisplay-Regular"
            case .bold:
                return "SFProDisplay-Bold"
            case .light:
                return "SFProDisplay-Light"
            }
        }
    }
    
    static func customFont(type: FontStyle, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.getFontName(), size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
