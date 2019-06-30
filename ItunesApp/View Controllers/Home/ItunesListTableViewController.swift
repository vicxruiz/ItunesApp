//
//  ItunesListTableViewController.swift
//  ItunesApp
//
//  Created by Victor  on 6/30/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation
import UIKit

class ItunesListTableViewController: UITableViewController {
    
    //passing data
    let itunesController = ItunesController()
    let dataGetter = DataGetter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSongs()
        fetchAlbums()
    }
    
    //MARK: Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returning item count in array
        if section == 0 {
           return itunesController.songs.count
        } else if section == 1 {
            return itunesController.albums.count
        } else {
            return 0
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //configure cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath)
        let media = mediaFor(indexPath: indexPath)
        guard let mediaCell = cell as? ItunesMediaTableViewCell else {return cell}
        //passing data
        mediaCell.dataGetter = dataGetter
        mediaCell.media = media
        return cell
    }
    
    //MARK: SectionHeader
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //updates header view ui
        view.tintColor = Service.itunesBaseColor
        guard let header = view as? UITableViewHeaderFooterView else {return}
        
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        header.textLabel?.textColor = Service.itunesSecondaryColor
        header.textLabel?.textAlignment = .left
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //updates header height
        return 44
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //logic for each section
        if (section == 0) {
            return "Songs"
        } else if (section == 1) {
            return "Albums"
        }
        else {
            return nil
        }
    }
    
    //Fetching songs and albums
    
    func fetchSongs() {
        itunesController.fetchTopSongs { (error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                }
                self.tableView.reloadData()
                print("Table reloaded")
            }
        }
    }
    
    func fetchAlbums() {
        itunesController.fetchTopAlbums { (error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                }
                self.tableView.reloadData()
                print("Table reloaded")
            }
        }

    }
    
    //logic to get media index path
    private func mediaFor(indexPath: IndexPath) -> Media {
        if indexPath.section == 0 {
            return itunesController.songs[indexPath.row]
        } else {
            return itunesController.albums[indexPath.row]
        }
    }

}
