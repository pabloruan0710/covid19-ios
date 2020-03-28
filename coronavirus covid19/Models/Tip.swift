//
//  Tip.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 27/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

struct Tip: Decodable {
    
    var objectId: String
    var texto: String
    var imagem: TipImage?
    var resumo: String
    var titulo: String
    var link: String?
}

struct TipEncodedPost: Encodable {
    //var `where`: [String:Any]
    var limit: Int
    var order: String
    var _method: String
    var _ApplicationId: String
    var _ClientVersion: String
    var _InstallationId: String
}

struct TipImage: Decodable {
    var name: String?
    var url: String?
}
