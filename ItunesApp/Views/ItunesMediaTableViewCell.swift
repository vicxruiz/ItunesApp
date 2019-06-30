//
//  ItunesMediaTableViewCell.swift
//  ItunesApp
//
//  Created by Victor  on 6/30/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation
import UIKit

class ItunesMediaTableViewCell: UITableViewCell {
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var mediaNameLabel: UILabel!
    var dataGetter: DataGetter?
    var song: Song? {
        didSet {
            updateViews()
        }
    }
    
    //updates views on cell
    private func updateViews() {
        //unwrap object
        guard let song = song else {
            print("no song")
            return
        }
        //setting cell labels to object properties
        mediaNameLabel.text = song.name
        setImage()
    }
    
    //logic to fetch image data
    private func setImage() {
        guard let artworkURL = song?.artworkUrl100,
            let url = URL(string: artworkURL) else { return }
        let request = URLRequest(url: url)
        
        dataGetter?.fetchData(with: request, requestID: song?.artworkUrl100) { [weak self] (requestID, data, error) in
            guard error == nil else { return }
            guard requestID == self?.song?.artworkUrl100 else { return }
            guard let data = data else { return }
            
            //converting data to image
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                self?.mediaImageView.image = image
            }
        }
    }
    
}
