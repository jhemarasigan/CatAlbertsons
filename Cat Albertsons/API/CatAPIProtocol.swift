//
//  CatAPIProtocol.swift
//  Cat Albertsons
//
//  Created by Marasigan, Jerome (Cognizant) on 10/7/24.
//

protocol CatAPIProtocol {
  func fetchCatFact(completion: @escaping (CatFact?) -> Void)
  func fetchCatImage(completion: @escaping (CatImage?) -> Void)
}
