//
//  DetailPhotoView.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import SwiftUI

struct DetailPhotoView: View {
    var photo: Photo
    
    var body: some View {
        VStack{
            Text(photo.title)
                .font(.system(size: 30))
            AsyncImage(url: URL(string: "\(photo.url)")) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding()
        }
    }
}

struct DetailPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPhotoView(photo: Photo(albumId: 1, id: 1, title: "tittle", url: "url", thumbnailUrl: "THurl"))
    }
}
