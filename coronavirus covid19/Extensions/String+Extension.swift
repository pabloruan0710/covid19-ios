//
//  String+Extension.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation


extension String {
    
    var localized: String {
        return NSLocalizedString(String(describing: self), comment: "")
    }
}
