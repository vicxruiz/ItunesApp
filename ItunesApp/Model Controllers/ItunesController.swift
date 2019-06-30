//
//  ItunesController.swift
//  ItunesApp
//
//  Created by Victor  on 6/30/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation

class ItunesController {
    //passing data
    let dataGetter = DataGetter()
    let topSongsURL = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/50/explicit.json")!
    var songs: [Song] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func fetchTopSongs(completion: @escaping (Error?) -> Void) {
        var request = URLRequest(url: topSongsURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        dataGetter.fetchData(with: request) { (_, data, error) in
            //error handling
            if let error = error {
                completion(error)
            }
            guard let data = data else { return }
            
            //decoding
            let decoder = JSONDecoder()
            do {
                let data = try decoder.decode(Root.self, from: data)
                self.songs = data.feed.results
                completion(nil)
            } catch {
                print("error decoding data: \(error)")
                completion(error)
            }
        }
    }
    
}
