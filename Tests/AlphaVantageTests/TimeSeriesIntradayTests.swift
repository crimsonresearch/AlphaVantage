//
//  TimeSeriesIntradayTests.swift
//
//
//  Created by Waqar Malik on 10/29/20.
//

@testable import AlphaVantage
import HTTPTypes
import OSLog
import URLRequestable
import XCTest

final class TimeSeriesIntradayTests: XCTestCase {
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

	func testDecodeIntraday1Min() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesIntraday1min", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let intradaySeries = try decoder.decode(TimeSeriesIntraday1Min.self, from: data)
		XCTAssertEqual(intradaySeries.metadata.symbol, "AAPL")
		XCTAssertEqual(intradaySeries.timeSeries.count, 100)
	}

	func testIntraday1Min() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesIntraday1min", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let intraday: TimeSeriesIntraday1Min? = try await api?.getTimeSeriesIntraday(symbol: symbol, interval: .oneMinute)
		XCTAssertNotNil(intraday)
		XCTAssertEqual(intraday?.timeSeries.count, 100)
		XCTAssertEqual(intraday?.metadata.symbol, symbol)
	}

	func testDecodeIntraday5Min() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesIntraday5min", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let intradaySeries = try decoder.decode(TimeSeriesIntraday5Min.self, from: data)
		XCTAssertEqual(intradaySeries.metadata.symbol, "AAPL")
		XCTAssertEqual(intradaySeries.timeSeries.count, 100)
	}

	func testIntraday5Min() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesIntraday5min", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let intraday: TimeSeriesIntraday5Min? = try await api?.getTimeSeriesIntraday(symbol: symbol, interval: .fiveMinutes)
		XCTAssertNotNil(intraday)
		XCTAssertEqual(intraday?.timeSeries.count, 100)
		XCTAssertEqual(intraday?.metadata.symbol, symbol)
	}

	func testDecodeIntraday15Min() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesIntraday15min", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let intradaySeries = try decoder.decode(TimeSeriesIntraday15Min.self, from: data)
		XCTAssertEqual(intradaySeries.metadata.symbol, "AAPL")
		XCTAssertEqual(intradaySeries.timeSeries.count, 100)
	}

	func testIntraday15Min() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesIntraday15min", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let intraday: TimeSeriesIntraday15Min? = try await api?.getTimeSeriesIntraday(symbol: symbol, interval: .fifteenMinutes)
		XCTAssertNotNil(intraday)
		XCTAssertEqual(intraday?.timeSeries.count, 100)
		XCTAssertEqual(intraday?.metadata.symbol, symbol)
	}

	func testDecodeIntraday30Min() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesIntraday30min", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let intradaySeries = try decoder.decode(TimeSeriesIntraday30Min.self, from: data)
		XCTAssertEqual(intradaySeries.metadata.symbol, "AAPL")
		XCTAssertEqual(intradaySeries.timeSeries.count, 100)
	}

	func testIntraday30Min() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesIntraday30min", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let intraday: TimeSeriesIntraday30Min? = try await api?.getTimeSeriesIntraday(symbol: symbol, interval: .thirtyMinutes)
		XCTAssertNotNil(intraday)
		XCTAssertEqual(intraday?.timeSeries.count, 100)
		XCTAssertEqual(intraday?.metadata.symbol, symbol)
	}

	func testDecodeIntraday60Min() throws {
		guard let url = Bundle.module.url(forResource: "TimeSeriesIntraday60min", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let intradaySeries = try decoder.decode(TimeSeriesIntraday60Min.self, from: data)
		XCTAssertEqual(intradaySeries.metadata.symbol, "AAPL")
		XCTAssertEqual(intradaySeries.timeSeries.count, 100)
	}

	func testIntraday60Min() async throws {
		let symbol = "AAPL"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "TimeSeriesIntraday60min", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let intraday: TimeSeriesIntraday60Min? = try await api?.getTimeSeriesIntraday(symbol: symbol, interval: .oneHour)
		XCTAssertNotNil(intraday)
		XCTAssertEqual(intraday?.timeSeries.count, 100)
		XCTAssertEqual(intraday?.metadata.symbol, symbol)
	}
}
