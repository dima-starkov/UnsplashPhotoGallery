//
//  NetworkServices.swift
//  My App
//
//  Created by Дмитрий Старков on 23.10.2020.
//

import UIKit


class NetworkService {
    //постороение запроса по URL
    func reqest(searchTerm:String, completion:@escaping (Data?, Error?) -> Void) {
        let params = prepareParameters(searchTerm:searchTerm )
        let url = self.url(params: params)
        var reqest = URLRequest(url: url)
        reqest.allHTTPHeaderFields = prepareHeader()
        reqest.httpMethod = "get"
        let task = createDataTask(from: reqest, completion: completion)
        task.resume()
    }
    
    private func prepareHeader() -> [String:String]? {
        var headers = [String:String]()
        headers["Authorization"] = "Client-ID sY_3aTOpTM_JffbNkak2RFDH3g2CxPuZTY9DDdnulyA"
        return headers
    }
    
    private func prepareParameters(searchTerm:String?) -> [String:String] {
        var parameters = [String:String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func url(params:[String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from reqest: URLRequest, completion: @escaping (Data? , Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: reqest) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data,error)
            }
        }
    }
}
