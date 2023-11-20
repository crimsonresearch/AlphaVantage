@testable import AlphaVantage
import HTTPTypes
import os.log
import URLRequestable
import XCTest

private let log = Logger(subsystem: "net.crimsonresearch.AlphaVantage", category: "Tests")

final class AlphaVantageTests: XCTestCase {
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
}
