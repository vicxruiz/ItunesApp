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
        fetch()
    }
    
    //MARK: Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returning items in array
        return itunesController.songs.count
    }
    
    //configure cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath)
        guard let mediaCell = cell as? ItunesMediaTableViewCell else {return cell}
        //passing data
        mediaCell.dataGetter = dataGetter
        let song = itunesController.songs[indexPath.row]
        mediaCell.song = song
        
        return cell
    }
    
    //MARK: SectionHeader
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //updates header view ui
        view.tintColor = UIColor.white
        guard let header = view as? UITableViewHeaderFooterView else {return}
        
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        header.textLabel?.textColor = UIColor.lightGray
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
        } else {
            return nil
        }
    }
    
    func fetch() {
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
    
    
    
}
