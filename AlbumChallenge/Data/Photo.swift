//
//  Photo.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import Foundation
//MODELO DE RESPUESTA
//{
//   "albumId": 1,
//   "id": 1,
//   "title": "accusamus beatae ad facilis cum similique qui sunt",
//   "url": "https://via.placeholder.com/600/92c952",
//   "thumbnailUrl": "https://via.placeholder.com/150/92c952"
// }

struct Photo: Decodable, Hashable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
