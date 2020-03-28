//
//  NetworkProtocolType.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

protocol NetworkProtocolType: class {
    func get<T: Decodable>(url: String, response: T.Type, completion: @escaping (Bool, T?)->Void)
    func post<T: Decodable, EncodableType: Encodable>(url: String, params: EncodableType?, response: T.Type, completion: @escaping (Bool, T?)->Void)
}
