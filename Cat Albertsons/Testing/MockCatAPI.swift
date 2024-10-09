//
//  MockCatAPI.swift
//  Cat Albertsons
//
//  Created by Marasigan, Jerome (Cognizant) on 10/7/24.
//

class MockCatAPI: CatAPIProtocol {
  var mockCatFact: CatFact?
  var mockCatImage: CatImage?

  func fetchCatFact(completion: @escaping (CatFact?) -> Void) {
    completion(mockCatFact)
  }

  func fetchCatImage(completion: @escaping (CatImage?) -> Void) {
    completion(mockCatImage)
  }
}
