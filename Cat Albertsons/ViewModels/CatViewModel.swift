//
//  CatViewModel.swift
//  Cat Albertsons
//
//  Created by Marasigan, Jerome (Cognizant) on 10/7/24.
//

import Foundation
import SwiftUI

class CatViewModel: CatViewModelProtocol, ObservableObject {
  @Published var data: [String] = [""]
  @Published var imageUrl: String?

  private var api: CatAPIProtocol

  init(
    api: CatAPIProtocol = CatAPI()
  ) {
    self.api = api
  }

  func fetchNewCatData() {
    api.fetchCatFact { [weak self] catFact in
      DispatchQueue.main.async {
        self?.data = catFact?.data ?? [""]
      }
    }

    api.fetchCatImage { [weak self] catImage in
      DispatchQueue.main.async {
        self?.imageUrl = catImage?.url
      }
    }
  }
}
