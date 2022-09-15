//
//  AlbumChallengeApp.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import SwiftUI

@main
struct AlbumChallengeApp: App {
    @StateObject var albums = Albums()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    NetWorking.shared.getAlbumsAlamofire { response in
                        albums.albums = response
                    } failure: { error in
                        print("Error al cargar los albums")
                    }
                }
                .environmentObject(albums)
        }
    }
}
