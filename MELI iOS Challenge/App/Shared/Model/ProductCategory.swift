//
//  ProductCategory.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 21/09/2022.
//

import Foundation

class ProductCategory: Codable {
    var content: [Content]
}

struct Content : Codable {
    let id: String
    let position: Int
    let type: String
}

struct TopProductsError: Codable {
    let error: String
    let message: String
}

