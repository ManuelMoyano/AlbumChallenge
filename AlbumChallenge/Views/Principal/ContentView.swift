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
                ScrollIconAlbumView(albums: albums, scrollIndex: $scrollIndex)
//                Text("\(scrollIndex)")
                if scrollIndex > 0 {
                    Photosview(album: albums[scrollIndex])
                } else {
                    Rectangle()
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle("Albums")
        }.onAppear {
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
