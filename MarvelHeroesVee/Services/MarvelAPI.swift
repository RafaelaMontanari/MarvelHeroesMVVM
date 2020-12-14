//
//  MarvelAPI.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 12/12/20.
//

import Foundation
import SwiftHash
import Alamofire

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class MarvelAPI {
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let basePathDetails = "https://gateway.marvel.com/v1/public/characters/"
    static private let publicKey = "0297366ff6f685528488f56b06222f33"
    static private let privateKey = "20a25e97c3d85d0d0125c186efd10b0a7e410163"
    static private let limit = 50
    
    func loadHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * MarvelAPI.limit
        let startsWith: String
        if let name = name, !name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        let url = MarvelAPI.basePath + "offset=\(offset)&limit=\(MarvelAPI.limit)&" + startsWith + MarvelAPI.getCredentials()
        print(url)
        AF.request(url).responseJSON { (response) in
            guard let data = response.data,
                let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    onComplete(nil)
                    return
            }
            onComplete(marvelInfo)
        }
    }
    
    func getHeroDetailsBy(id: Int,page: Int = 0, completion: @escaping (Result<Hero, NetworkError>) -> Void) {
        
        guard let url = URL.loadHeroDetailsById(id) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let heroDetail = try? JSONDecoder().decode(Hero.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(heroDetail))
            
        }.resume()
        
    }
    
    class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
