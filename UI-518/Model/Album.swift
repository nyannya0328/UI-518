//
//  Album.swift
//  UI-518
//
//  Created by nyannyan0328 on 2022/03/25.
//

import SwiftUI

struct Album: Identifiable {
    var id = UUID().uuidString
    var albumName : String
    var albumImage : String
    var isLiked : Bool = false
}

var albums: [Album] = [

    Album(albumName: "Positions", albumImage: "Album1"),
    Album(albumName: "The Best", albumImage: "Album2",isLiked: true),
    Album(albumName: "My Everything", albumImage: "Album3"),
    Album(albumName: "Yours Truly", albumImage: "Album4"),
    Album(albumName: "Sweetener", albumImage: "Album5",isLiked: true),
    Album(albumName: "Rain On Me", albumImage: "Album6"),
    Album(albumName: "Stuck With U", albumImage: "Album7"),
    Album(albumName: "7 rings", albumImage: "Album8",isLiked: true),
    Album(albumName: "Bang Bang", albumImage: "Album9"),
]

