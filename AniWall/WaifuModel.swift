//
//  WaifuModel.swift
//  AniWall
//
//  Created by Adam O. on 2/7/22.
//

import Foundation

struct ToDo: Identifiable, Decodable {
    var url: URL
  
  enum CodingKeys: String, CodingKey {
    case isComplete = "completed"
    case userId, id, title
  }
}

extension URLSession {
  func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let object = try JSONDecoder().decode(T.self, from: data)
          completion(.success(object))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}


