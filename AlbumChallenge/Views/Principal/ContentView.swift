//
//  AlbumView.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var albums = [Album]()
    @State var scrollIndex = 0
    
    var body: some View {
        NavigationView{
            HStack{
                if albums.count > 0 {
                ScrollIconAlbumView(albums: albums, scrollIndex: $scrollIndex)
                        .padding(.top, 1)
                    Photosview(album: albums[scrollIndex])
                        .padding(.top, 1)
                } else {
                    Rectangle()
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle("Albums")
        }
        .onAppear {
            NetWorking.shared.getAlbumsAlamofire { response in
                albums = response
            } failure: { error in
                print("Error al cargar los albums")
            }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
