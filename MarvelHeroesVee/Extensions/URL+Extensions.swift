//
//  URL+Extensions.swift
//  MarvelHeroesVee
//
//  Created by Rafaela da Silva Cunha Montanari on 13/12/20.
//

import Foundation

extension URL {
    
    static func loadHeroDetailsById(_ id: Int, page: Int = 0) -> URL? {
        let offset = page * Constants.limit
        let heroIdString = String(id)
        return URL(string: Constants.basePathDetails + "offset=\(offset)&limit=\(Constants.limit)&" + heroIdString + MarvelAPI.getCredentials())
    }
    
}
