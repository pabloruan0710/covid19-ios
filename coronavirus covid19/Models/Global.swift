//
//  Global.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

struct Global: Decodable {
    var cases: Int64
    var deaths: Int64
    var recovered: Int64
    var updated: Int64
}
