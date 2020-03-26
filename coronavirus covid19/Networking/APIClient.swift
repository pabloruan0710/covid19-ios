//
//  APIClient.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation
import Alamofire

class APIClient: NetworkProtocolType {
  
    func get<T: Decodable>(url: String, response: T.Type, completion: @escaping (Bool, T?)->Void) {
        AF.request(url).responseDecodable(of: response.self) { response in
            switch response.result {
            case .success(let values):
                completion(true, values)
            case .failure(let err):
                completion(false, nil)
                print(err.localizedDescription)
            }
        }
    }
}
