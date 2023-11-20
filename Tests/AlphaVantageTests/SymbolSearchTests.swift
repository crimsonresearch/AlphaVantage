//
//  SymbolSearchTests.swift
//
//
//  Created by Waqar Malik on 11/9/20.
//

@testable import AlphaVantage
import HTTPTypes
import os.log
import URLRequestable
import XCTest

final class SymbolSearchTests: XCTestCase {
	var api: AlphaVantage?

	override func setUpWithError() throws {
		let config = URLSessionConfiguration.ephemeral
		config.protocolClasses = [URLProtocolMock.self]

		let session = URLSession(configuration: config)
		api = AlphaVantage(apiKey: "demo", session: session)
	}

	override func tearDownWithError() throws {
		api = nil
	}

	func testDecodeSymbolSearch() throws {
		guard let url = Bundle.module.url(forResource: "SymbolSearch", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let searchResults = try decoder.decode(SymbolSearchResponse.self, from: data)
		XCTAssertEqual(searchResults.bestMatches.count, 6)
	}

	func testSymbolSearch() async throws {
		let symbol = "Tencent"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "SymbolSearch", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let symbols = try await api?.getSymbolSearch(query: symbol)
		XCTAssertNotNil(symbols)
		XCTAssertEqual(symbols?.count, 6)
	}
}
