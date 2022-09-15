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
    let layout = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach (photos, id: \.self) { photo in
                        NavigationLink{
                            DetailPhotoView(photo: photo)
                        } label: {
                            VStack{
                                AsyncImage(url: URL(string: "\(photo.thumbnailUrl)")) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 75, height: 75)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                Text(photo.title)
//                                    .frame(width: 150, height: 60, alignment: .center)
                            }
                        }
                }
            }
        }
        .onAppear {
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
