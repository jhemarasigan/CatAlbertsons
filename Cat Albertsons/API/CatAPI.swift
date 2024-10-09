//
//  CatAPI.swift
//  Cat Albertsons
//
//  Created by Marasigan, Jerome (Cognizant) on 10/7/24.
//

import Foundation

class CatAPI: CatAPIProtocol {
  func fetchCatFact(completion: @escaping (CatFact?) -> Void) {
    let url = URL(string: "https://meowfacts.herokuapp.com/?count=10")!
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
      if let data = data {
        let catFact = try? JSONDecoder().decode(CatFact.self, from: data)
        completion(catFact)
      } else {
        completion(nil)
      }
    }
    task.resume()
  }

  func fetchCatImage(completion: @escaping (CatImage?) -> Void) {
    let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10")!
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
      if let data = data {
        let catImages = try? JSONDecoder().decode([CatImage].self, from: data)
        completion(catImages?.first)
      } else {
        completion(nil)
      }
    }
    task.resume()
  }
}
