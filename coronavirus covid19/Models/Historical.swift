//
//  Historical.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 27/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

struct Historical: Decodable {
    var country: String
    var province: String?
    var timeline: Timeline?
}


struct Timeline: Decodable {
    var cases: Dictionary<String,Int64>?
    var deaths:  Dictionary<String,Int64>?
}
