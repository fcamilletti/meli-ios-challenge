//
//  Networking.swift
//  MELI iOS Challenge
//
//  Created by Franco Camilletti on 13/09/2022.
//
//
//import Foundation
//
//protocol Networking {
//    var baseUrl: String { get }
//
//    func buildSecureRequest(_ url: URL) -> URLRequest
//    func call<Model: Decodable>(_ request: URLRequest, completion: @escaping ((Result<Model, Error>) -> Void))
//}
//
//class RestClient: Networking {
//    let baseUrl: String = "https://api.mercadolibre.com/"
//    private var accessToken: String = "APP_USR-8244347915612437-091405-a31740b9409dc871152a9fb4f4b60108-239968046"
//
//    static let shared = RestClient()
//
//    private init() {}
//
//
//    // MARK: - Internal Functions
//
//    func buildSecureRequest(_ url: URL) -> URLRequest {
//        var urlRequest = URLRequest(url: url)
//        urlRequest.setValue("Bearer \(RestClient.shared.accessToken)", forHTTPHeaderField: "Authentication")
//
//        return urlRequest
//    }
//
//    func call<Model: Decodable>(_ request: URLRequest, completion: @escaping ((Result<Model, Error>) -> Void)) {
//        let task = URLSession.shared.dataTask(with: request) { data, _, error in
//            guard let data = data, error == nil else { return }
//
//            do {
//                let result = try JSONDecoder().decode(Model.self, from: data)
//                completion(.success(result))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//}
