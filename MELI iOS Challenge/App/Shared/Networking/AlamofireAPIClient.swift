//
//  APIManager.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 21/09/2022.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-8244347915612437-092211-c5270da574aa7640a46829bfa710fb3b-239968046") ]
    
    func get(url: String, completion: @escaping
    (Result<Data?, AFError>) -> Void) {
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}
