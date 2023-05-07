//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Дмитрий Федоров on 07.05.2023.
//

import UIKit

enum Link {
    case episodes
    
    var url: URL {
        switch self {
        case .episodes:
            return URL(string: "https://rickandmortyapi.com/api/episode")!
        }
    }
}

final class ViewController: UIViewController {
    @IBAction func buttonGoPressed(_ sender: Any) {
        let request = URLSession.shared.dataTask(with: Link.episodes.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let episodesResponse = try decoder.decode(EpisodesResponse.self, from: data)
                
                episodesResponse.episodes.forEach { episode in
                    print(episode)
                }
            } catch {
                print(error)
            }
            
        }
        request.resume()
    }
}

