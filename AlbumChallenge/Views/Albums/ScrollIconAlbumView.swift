//
//  ScrollIconAlbumView.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 15/09/2022.
//

import SwiftUI

struct ScrollIconAlbumView: View {
    var albums: [Album]
    @State var scrollIndex = 0
    @State var photos = [Photo]()
    
    var body: some View {
        
        HStack{
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<albums.count, id: \.self) { i in
                        IconAlbumView(album: albums[i])
                            .onTapGesture {
                                
                                scrollIndex = i
                                
                                NetWorking.shared.getPhotosAlamofire(album: albums[scrollIndex].id) { response in
                                    photos = response
                                } failure: { error in
                                    print ("Error al cargar las fotos")
                                }
                            }
                    }
                }
            }
            .frame(width: 110)
            
            Photosview(album: albums[scrollIndex], photos: photos)
                .padding(.top, 1)
        }
    }
}

struct ScrollIconAlbumView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollIconAlbumView(albums: [Album]())
    }
}
