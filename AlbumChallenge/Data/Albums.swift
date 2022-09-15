//
//  Albums.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 15/09/2022.
//

import Foundation

class Albums: ObservableObject {
    @Published var albums = [Album]()
}
