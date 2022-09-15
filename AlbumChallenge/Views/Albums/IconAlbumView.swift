//
//  IconAlbumView.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 15/09/2022.
//

import SwiftUI

struct IconAlbumView: View {
    var album: Album
    
    var body: some View {
        VStack{
            Image("folder")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Text(album.title)
        }
    }
}

struct IconAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        IconAlbumView(album: Album.example)
    }
}
