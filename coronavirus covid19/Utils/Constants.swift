//
//  Constants.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

struct Constants {
    static let base = "http://doups.com.br:4009/covid19"
    static let global : String = Constants.base+"/all"
    static let historical : String = "https://corona.lmao.ninja/v2/historical"
    static let countries : String  = Constants.base+"/countries"
    static let dicas: String = "http://mobileapps.saude.gov.br/coronavirus/classes/dicas"
}
