//
//  TopGainersLosersTests.swift
//
//
//  Created by Waqar Malik on 11/19/23.
//

@testable import AlphaVantage
import HTTPRequestable
import HTTPTypes
import OSLog
import XCTest

final class TopGainersLosersTests: XCTestCase {
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

	func testDecodeGainersLosers() throws {
		guard let url = Bundle.module.url(forResource: "TopGainersLosers", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let gainersLosers = try decoder.decode(TopGainersLosers.self, from: data)
		XCTAssertNotNil(gainersLosers)
		XCTAssertEqual(gainersLosers.gainers.count, 20)
		XCTAssertEqual(gainersLosers.losers.count, 20)
		XCTAssertEqual(gainersLosers.mostActivelyTraded.count, 20)
	}
}
