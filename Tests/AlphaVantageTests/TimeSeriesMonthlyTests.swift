//
//  TimeSeriesMonthlyTests.swift
//
//  Created by Waqar Malik on 11/18/23.
//

@testable import AlphaVantage
import HTTPTypes
import OSLog
import URLRequestable
import XCTest

final class TimeSeriesMonthlyTests: XCTestCase {
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

	func testDecodeTimeSeriesMonthly() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesMonthly", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let timeSeries = try decoder.decode(TimeSeriesMonthly.self, from: data)
		let metadata = timeSeries.metadata
		XCTAssertEqual(metadata.symbol, "AAPL")
		XCTAssertEqual(timeSeries.timeSeries.count, 288)
	}

	func testTimeSeriesMonthly() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesMonthly", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let monthly = try await api?.getTimeSeriesMonthly(symbol: symbol)
		XCTAssertNotNil(monthly)
		XCTAssertEqual(monthly?.timeSeries.count, 288)
		XCTAssertEqual(monthly?.metadata.symbol, symbol)
	}
}
