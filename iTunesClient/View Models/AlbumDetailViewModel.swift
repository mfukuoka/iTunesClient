//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by thechemist on 8/3/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation
import UIKit

struct AlbumDetailViewModel {
    let artwork: UIImage
    let title: String
    let releaseDate: String
    let genre: String
    
}

extension AlbumDetailViewModel {
    init(album: Album) {
       
        self.artwork = album.artworkState == .downloaded ? album.artwork! : #imageLiteral(resourceName: "AlbumPlaceholder") //
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "MMM dd, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
