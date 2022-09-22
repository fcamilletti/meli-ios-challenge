//
//  Request.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 21/09/2022.
//

import Foundation

enum Request {
    static var categoriesURL : String { return "http://www.boredapi.com/api/" }
    static var productURL : String { return "" }
}

extension Request {
    enum ProductCategory { }
    enum Product { }
}
