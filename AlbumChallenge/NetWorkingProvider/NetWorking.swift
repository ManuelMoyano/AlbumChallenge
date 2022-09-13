//
//  NetWorking.swift
//  AlbumChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import Foundation
import Alamofire


//https://jsonplaceholder.typicode.com/albums/1/photos

final class NetWorking {
    static let shared = NetWorking()
    private init() {}
    
    func getAlbumsAlamofire (success: @escaping (_ albums: [Album])->(), failure: @escaping (_ error: Error?)->()){
        
        let url = "https://jsonplaceholder.typicode.com/albums"
        
        AF.request(url, method: .get).responseDecodable(of: [Album].self) { response in
            
            if let albumsResponse = response.value {
                print ("Se cargaron los albums")
                success(albumsResponse)
            } else {
                print ("No se encontraron los albums por el error: \(String(describing: response.error))")
                failure(response.error)
            }
        }
        
    }
    
    func getPhotosAlamofire (album: Int, success: @escaping (_ photos: [Photo])->(), failure: @escaping (_ error: Error?)->()){
        
        let url = "https://jsonplaceholder.typicode.com/albums/\(album)/photos"
        
        AF.request(url, method: .get).responseDecodable(of: [Photo].self) { response in
            
            if let photosResponse = response.value {
                print ("Se cargaron las fotos")
                success(photosResponse)
            } else {
                print ("No se encontraron los albums por el error: \(String(describing: response.error))")
                failure(response.error)
            }
        }
        
    }
    
    
    
    
}
