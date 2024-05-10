//
//  TimeSeriesDailyTests.swift
//
//  Created by Waqar Malik on 11/18/23.
//

@testable import AlphaVantage
import HTTPTypes
import OSLog
import HTTPRequestable
import XCTest

final class TimeSeriesDailyTests: XCTestCase {
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

	func testDecodeTimeSeriesDaily() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesDaily", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let timeSeriesDaily = try decoder.decode(TimeSeriesDaily.self, from: data)
		let metadata = timeSeriesDaily.metadata
		XCTAssertEqual(metadata.symbol, "AAPL")
		XCTAssertEqual(timeSeriesDaily.timeSeries.count, 100)
	}

	func testTimeSeriesDaily() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesDaily", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let daily = try await api?.getTimeSeriesDaily(symbol: symbol)
		XCTAssertNotNil(daily)
		XCTAssertEqual(daily?.timeSeries.count, 100)
		XCTAssertEqual(daily?.metadata.symbol, symbol)
	}
}
