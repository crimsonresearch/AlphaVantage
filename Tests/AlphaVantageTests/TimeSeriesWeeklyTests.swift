//
//  TimeSeriesWeeklyTests.swift
//
//
//  Created by Waqar Malik on 11/18/23.
//

@testable import AlphaVantage
import HTTPRequestable
import HTTPTypes
import OSLog
import XCTest

final class TimeSeriesWeeklyTests: XCTestCase {
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

	func testDecodeTimeSeriesWeekly() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesWeekly", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let timeSeries = try decoder.decode(TimeSeriesWeekly.self, from: data)
		let metadata = timeSeries.metadata
		XCTAssertEqual(metadata.symbol, "AAPL")
		XCTAssertEqual(timeSeries.timeSeries.count, 1254)
	}

	func testTimeSeriesWeekly() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesWeekly", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, headerFields: [.contentType(.json)])
			return (response, data)
		}

		let weekly = try await api?.getTimeSeriesWeekly(symbol: symbol)
		XCTAssertNotNil(weekly)
		XCTAssertEqual(weekly?.timeSeries.count, 1254)
		XCTAssertEqual(weekly?.metadata.symbol, symbol)
	}
}
