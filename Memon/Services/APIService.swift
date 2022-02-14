//
//  APIService.swift
//  Memon
//
//  Created by kosuke sakai on 2022/02/09.
//

import Foundation

struct APIService {
    private let baseURL = "https://www.googleapis.com/books/v1/volumes"
    
    func fetchBooksData(_ searchText: String, completion: @escaping (Books) -> Void ) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.query = "q=\(searchText)"
        let url = urlComponents?.url
        
        let task = session.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse else {
                print("no data or no response")
                return
            }

            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(Books.self, from: data)
                    completion(results)
                } catch {
                    print("デコードエラー")
                }
            } else {
                print("サーバエラー ステータスコード: \(response.statusCode)\n")
            }
        }
        task.resume()
    }
}
