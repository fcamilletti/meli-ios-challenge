//
//  Request.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 21/09/2022.
//

import Foundation

enum Request {
    static var categoriesURL : String { return "https://api.mercadolibre.com/sites/MLA/domain_discovery/search?" }
    static var productURL : String { return "" }
}

extension Request {
    enum ProductCategory { }
    enum Product { }
}
