//
//  CatViewModelTests.swift
//  Cat Albertsons
//
//  Created by Marasigan, Jerome (Cognizant) on 10/7/24.
//

import XCTest

class CatViewModelTests: XCTestCase {
  var viewModel: CatViewModel!
  var mockAPI: MockCatAPI!

  override func setUp() {
    super.setUp()
    mockAPI = MockCatAPI()
    viewModel = CatViewModel(api: mockAPI)
  }

  func testFetchNewCatData() {
    // Arrange
    let expectedFact = CatFact(data: ["Cats are awesome!"])
    let expectedImage = CatImage(url: "http://example.com/cat.jpg")

    mockAPI.mockCatFact = expectedFact
    mockAPI.mockCatImage = expectedImage

    // Act
    let expectation = XCTestExpectation(description: "Fetch new cat data")
    viewModel.fetchNewCatData()

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      // Assert
      XCTAssertNotNil(self.viewModel.data)
      XCTAssertNotNil(self.viewModel.imageUrl)
      XCTAssertEqual(self.viewModel.data, expectedFact.data)
      XCTAssertEqual(self.viewModel.imageUrl, expectedImage.url)
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 1.0)
  }
}
