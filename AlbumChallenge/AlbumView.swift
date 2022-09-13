//
//  AlbumView.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import SwiftUI

struct AlbumView: View {
    @State private var albums = [Album]()
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach (albums, id: \.self){ album in
                        NavigationLink {
                            Photosview(album: album)
                        } label: {
                            Text(album.title)
                        }
                    }
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

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
