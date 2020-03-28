//
//  Int+Extension.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 25/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

extension Int64 {
    
    var formatarMilhar: String {
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self)) ?? self.description
    }
}

