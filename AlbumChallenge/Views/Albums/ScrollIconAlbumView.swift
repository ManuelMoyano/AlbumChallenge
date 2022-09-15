//
//  ScrollIconAlbumView.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 15/09/2022.
//

import SwiftUI

struct ScrollIconAlbumView: View {
    var albums: [Album]
    
    var body: some View {

        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<albums.count, id: \.self) { i in
                    IconAlbumView(album: albums[i])
                }
            }
        }
        .frame(width: 110)
    }
}

struct ScrollIconAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollIconAlbumView(albums: [Album]())
    }
}
