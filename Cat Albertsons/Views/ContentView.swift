//
//  ContentView.swift
//  Cat Albertsons
//
//  Created by Marasigan, Jerome (Cognizant) on 10/7/24.
//

import SwiftUI

struct CatView: View {
  @StateObject private var viewModel = CatViewModel()

  var body: some View {
    VStack {
      if let urlString = viewModel.imageUrl,
         let url = URL(string: urlString) {
        AsyncImage(url: url) { image in
          image
            .resizable()
            .scaledToFit()
            .frame(height: 300)
        } placeholder: {
          ProgressView()
        }
      }

      Text(viewModel.data.first ?? "")
        .padding()
        .multilineTextAlignment(.center)

      Button(action: {
        viewModel.fetchNewCatData()
      }) {
        Text("Get Another Cat Fact & Image")
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
          .cornerRadius(10)
      }
    }
    .padding()
    .onAppear {
      viewModel.fetchNewCatData()
    }
  }
}
