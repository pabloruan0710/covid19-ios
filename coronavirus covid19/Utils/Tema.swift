//
//  Tema.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation
import UIKit

struct Theme {
    private init(){}
    
    struct colors {
        private init(){}
        
        static var `default`: UIColor {
            return UIColor(hexString: "#000000")
        }
    }
    
    struct font {
        enum fontType: String {
            case light = "AvenirNext-light"
            case normal = "AvenirNext-regular"
            case bold = "AvenirNext-bold"
            case medium = "AvenirNext-medium"
            case black = "AvenirNext-black"
            case heavy = "AvenirNext-heavy"
        }
        
        static func light(size: CGFloat) -> UIFont {
            return UIFont(name: fontType.light.rawValue, size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
        }
        
        static func normal(size: CGFloat) -> UIFont {
            return UIFont(name: fontType.normal.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        static func medium(size: CGFloat) -> UIFont {
            return UIFont(name: fontType.medium.rawValue, size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
        }
        
        static func bold(size: CGFloat) -> UIFont {
            return UIFont(name: fontType.bold.rawValue, size: size) ?? UIFont.boldSystemFont(ofSize: size)
        }
        
        static func black(size: CGFloat) -> UIFont {
            return UIFont(name: fontType.black.rawValue, size: size) ?? UIFont.systemFont(ofSize: size, weight: .black)
        }
        
        static func heavy(size: CGFloat) -> UIFont {
            return UIFont(name: fontType.heavy.rawValue, size: size) ?? UIFont.systemFont(ofSize: size, weight: .heavy)
        }
    }
}
