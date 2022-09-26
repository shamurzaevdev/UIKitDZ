//
//  File.swift
//  UIKitDZ
//
//  Created by Эл on 26.09.2022.
//

import Foundation

class Song {
    var name: String
    var artist: String
    var albumImage: String
    var song: String
    init(name: String, artist: String, albumImage: String, song: String) {
        self.name = name
        self.artist = artist
        self.albumImage = albumImage
        self.song = song
    }
}
