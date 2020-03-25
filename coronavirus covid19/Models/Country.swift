//
//  Covid19.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var id: Int
    var pais: String
    var casos: Int64
    var casos_hoje: Int64
    var mortes: Int64
    var mortes_hoje: Int64
    var recuperados: Int64
    var criticos: Int64
    var dia: Date
    var atualizacao: String
}
