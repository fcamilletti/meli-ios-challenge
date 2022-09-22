//
//  HomeSearchModel.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 22/09/2022.
//


import Foundation
import UIKit

protocol SearchServiceDelegate {
    func didFailWithError(error: String)
}

class SearchViewModel {
    
    private let searchService: SearchService
    var delegate: SearchServiceDelegate?
    
    init(service: SearchService){
        self.searchService = service
    }
    
    func getProductsDetail(product: String, completition: @escaping ([Product]) -> Void, onError: @escaping (String) -> Void){
        getCategoryId(product: product) { categoryId in
            self.getTopProducts(categoryId: categoryId) { topProducts in
                self.getProductsDetail(for: self.getIds(topProducts: topProducts)) { products in
                    completition(products)
                } onError: { error in
                    onError(error)
                }
            }
        }
    }
    
    private func getCategoryId(product: String, completition: @escaping (String) -> Void){
        searchService.getCategory(product: product) { categoryId in
            guard categoryId != "Not Found" else {
                self.delegate?.didFailWithError(error: "Categoria no encontrada, por favor intente con una categoria distinta.")
                return
            }
            completition(categoryId)
        }
    }
    
    private func getTopProducts(categoryId: String, completition: @escaping (ProductCategory) -> Void){
        searchService.getTopTwentyByCategory(categoryId: categoryId) { topProducts in
            let onlyItemProducts = topProducts.content.filter { product in
                product.type != "PRODUCT"
            }
            topProducts.content.removeAll()
            topProducts.content = onlyItemProducts
            completition(topProducts)
        } onError: { error in
            guard error.message != "unspecified_token" else {
                fatalError("unspecified_token")
            }
            self.delegate?.didFailWithError(error: error.message)
        }
    }
    
    private func getProductsDetail(for ids: String, completition: @escaping ([Product]) -> Void, onError:  @escaping (String) -> Void) {
        searchService.getProductsDetail(ids: ids) { products in
            completition(products)
        } onError: { error in
            onError(error)
        }
    }
    
    func getDescription(id: String, completition: @escaping (String) -> Void){
        searchService.getProductDescription(product: id) { descripcion in
            completition(descripcion)
        }
    }
}

extension SearchViewModel {
    private func getIds(topProducts: ProductCategory) -> String{
        var ids = ""
        for product in topProducts.content {
            ids += "\(product.id),"
        }
        return String(ids.trimmingCharacters(in: .whitespaces).dropLast())
    }
}
