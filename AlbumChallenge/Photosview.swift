//
//  Photosview.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import SwiftUI

struct Photosview: View {
    var album: Album
    @State private var photos = [Photo]()
    
    
    var body: some View {
            VStack{
                List{
                    ForEach (photos, id: \.self) { photo in
                        NavigationLink{
                            DetailPhotoView(photo: photo)
                        } label: {
                            HStack{
                                AsyncImage(url: URL(string: "\(photo.thumbnailUrl)")) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 30, height: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 2))
                                Text(photo.title)
                            }
                        }
                    }
                }
        }.onAppear {
            NetWorking.shared.getPhotosAlamofire(album: album.id) { response in
                photos = response
            } failure: { error in
                print ("Error al cargar las fotos")
            }

        }
        .navigationBarTitle(album.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Photosview_Previews: PreviewProvider {
    static var previews: some View {
        Photosview(album: Album(userId: 1, id: 1, title: "Title"))
    }
}
