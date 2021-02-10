//
//  NetworkService.swift
//  Pictures
//
//  Created by Tim Grinev on 10.02.2021.
//

import Foundation

func baceRequest<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: url) else {
        completion(.failure(NetworkError.wrongUrl as! Error))
        
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
            DispatchQueue.main.async {
                completion(.failure(error))
                
            }
            return
            
        }
        
        guard let data = data else {
            completion(.failure(NetworkError.dataNil as! Error))
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let decodedOblect = try decoder.decode(T.self, from: data)
            completion(.success(decodedOblect))
        } catch {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    } .resume()
}

enum NetworkError {
    case wrongUrl
    case dataNil
}
