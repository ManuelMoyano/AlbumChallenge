//
//  AlbumView.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var albums = [Album]()
    
    var body: some View {
        NavigationView{
            HStack{
                if albums.count > 0 {
                ScrollIconAlbumView(albums: albums)
                        .padding(.top, 1)
                } else {
                    ProgressView()
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
