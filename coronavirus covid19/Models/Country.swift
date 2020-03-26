//
//  Covid19.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var country: String?
    var countryInfo: CountryInfo?
    var cases: Int64
    var todayCases: Int64
    var deaths: Int64
    var todayDeaths: Int64
    var recovered: Int64
    var active: Int64
    var critical: Int64
    var casesPerOneMillion: Int64
    var deathsPerOneMillion: Int64
}

struct CountryInfo: Decodable {
    var iso2: String
    var iso3: String
    var lat: Double?
    var long: Double?
    var flag: String?
}
