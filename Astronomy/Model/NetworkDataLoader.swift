//
//  NetworkDataLoader.swift
//  Astronomy
//
//  Created by Jarren Campos on 6/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(from request: URLRequest, completion: @escaping( Data?, Error?) -> Void)
    func loadData(from url: URL, completion: @escaping( Data?, URLResponse?, Error?) -> Void)
}

extension URLSession : NetworkDataLoader {
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        dataTask(with: request) { (data, _, error) in
            completion(data, error)
        }.resume()
    }
    
    func loadData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    
    
}
