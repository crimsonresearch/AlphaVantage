//
//  Test.m
//
//
//  Created by Waqar Malik on 11/9/20.
//

@testable import AlphaVantage
import HTTPTypes
import os.log
import URLRequestable
import XCTest

final class GlobalQuoteTests: XCTestCase {
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

	func testDecodeGlobalQuoteResponse() throws {
		guard let url = Bundle.module.url(forResource: "GlobalQuote", withExtension: "json", subdirectory: "TestData") else {
			throw URLError(.fileDoesNotExist)
		}
		let data = try Data(contentsOf: url)
		let decoder = JSONDecoder()
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
		decoder.dateDecodingStrategy = .formatted(formatter)
		let quoteReponse = try decoder.decode(GlobalQuoteResponse.self, from: data)
		let quote = quoteReponse.globalQuote
		XCTAssertEqual(quote.symbol, "IBM")
		XCTAssertEqual(quote.high, Decimal(153.5000))
		XCTAssertEqual(quote.volume, 4421337)
		XCTAssertEqual(quote.previousClose, Decimal(153.0600))
		XCTAssertEqual(quote.change, Decimal(-0.1700))
		XCTAssertEqual(quote.changePercent, -0.001111)
	}

	func testGlobalQuote() async throws {
		let symbol = "IBM"
		URLProtocolMock.requestHandler = { request in
			guard let url = request.url else {
				throw URLError(.badURL)
			}
			let data = try Data(contentsOf: Bundle.module.url(forResource: "GlobalQuote", withExtension: "json", subdirectory: "TestData")!)
			let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: [HTTPField.Name.contentType.canonicalName: HTTPContentType.json])!
			return (response, data)
		}

		let quote = try await api?.getGlobalQuote(symbol: symbol)
		XCTAssertNotNil(quote)
		XCTAssertEqual(quote!.symbol, symbol)
	}
}
