//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by thechemist on 8/3/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultsDataSource()
    let client = ItunesAPIClient()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .cancel,
                            target: self,
                            action: #selector(SearchResultsController.dismissSearchResultsController))
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        tableView.dataSource = dataSource
        definesPresentationContext = true 
    }

    @objc func dismissSearchResultsController() {
        self.dismiss(animated: true, completion: nil)
    }

    //MARK: - Navigation
    override func prepare(for seque: UIStoryboardSegue, sender: Any?){
        if seque.identifier == "showAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let artist = dataSource.artist(at: indexPath)
                let albumListController = seque.destination as! AlbumListController
                
                client.lookupArtist(withId: artist.id) { artist, error in
                    albumListController.artist = artist
                    albumListController.tableView.reloadData()
                }
                
                
                
            }
        }
    }
    

}

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController){
        client.searchForArtists(withTerm: searchController.searchBar.text!) {
            [weak self] artists, error in
            self?.dataSource.update(with: artists)
            self?.tableView.reloadData()
        }
    }
}
