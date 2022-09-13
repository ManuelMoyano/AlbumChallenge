//
//  Album.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import Foundation

//MODELO DE RESPUESTA
//{
//  "userId": 1,
//  "id": 1,
//  "title": "quidem molestiae enim"
//}
struct Album: Decodable, Hashable {
    let userId: Int
    let id: Int
    let title: String
}

