//
//  CatViewModelProtocol.swift
//  Cat Albertsons
//
//  Created by Marasigan, Jerome (Cognizant) on 10/7/24.
//

import Combine
import Foundation

protocol CatViewModelProtocol {
  var data: [String] { get }
  var imageUrl: String? { get }
  func fetchNewCatData()
}
