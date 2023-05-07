//
//  Episode.swift
//  RickAndMorty
//
//  Created by Дмитрий Федоров on 07.05.2023.
//

import Foundation

struct EpisodesResponse: Decodable {
    let episodes: [Episode]
    
    enum CodingKeys: String, CodingKey {
        case episodes = "results"
    }
}

struct Episode: Decodable {
    let id: Int
    let name: String
}
