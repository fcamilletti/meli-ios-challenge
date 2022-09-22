//
//  Product.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 21/09/2022.
//

import Foundation

class Product : Codable {
    var body: ItemBody
}

struct ItemBody: Codable {
    let id: String
    let title: String
    let secure_thumbnail: String
    let price: Double
}
