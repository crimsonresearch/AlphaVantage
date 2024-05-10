//
//  GlobalMarketStatusTests.swift
//
//
//  Created by Waqar Malik on 11/19/23.
//

@testable import AlphaVantage
import HTTPTypes
import OSLog
import HTTPRequestable
import XCTest

final class GlobalMarketStatusTests: XCTestCase {
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

	func testDecodeGlobalMarketStatus() throws {
		guard let url = Bundle.module.url(forResource: "GlobalMarketStatus", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let globalMarketStatus = try decoder.decode(GlobalMarketStatus.self, from: data)
		XCTAssertNotNil(globalMarketStatus)
		XCTAssertEqual(globalMarketStatus.markets.count, 16)
	}

	func testGlobalMarketStatus() async throws {
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "GlobalMarketStatus", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let markets = try await api?.getGlobalMarketStatus()
		XCTAssertNotNil(markets)
		XCTAssertEqual(markets?.count, 16)
	}
}
