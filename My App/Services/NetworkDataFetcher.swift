//
//  NetworkDataFetcher.swift
//  My App
//
//  Created by Дмитрий Старков on 28.10.2020.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        networkService.reqest(searchTerm: searchTerm) { (data, error) in
        if let error = error {
            print("error received requesting data: \(error.localizedDescription)")
            completion(nil)
        }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
    }
}
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to Decode JSON", jsonError)
            return nil
        }
        
    }

}
