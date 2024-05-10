//
//  IntradayMetadata.swift
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation

public struct IntradayMetadata: Codable, Hashable, Sendable {
	public let information: String
	public let symbol: String
	public let lastRefreshed: Date
	public let interval: IntradayInterval
	public let outputSize: String
	public let timeZone: TimeZone

	public init(information: String, symbol: String, lastRefreshed: Date, interval: IntradayInterval, outputSize: String, timeZone: TimeZone) {
		self.information = information
		self.symbol = symbol
		self.lastRefreshed = lastRefreshed
		self.interval = interval
		self.outputSize = outputSize
		self.timeZone = timeZone
	}

  public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.information = try container.decode(String.self, forKey: .information)
		self.symbol = try container.decode(String.self, forKey: .symbol)
		self.lastRefreshed = try container.decode(Date.self, forKey: .lastRefreshed)
		self.interval = try container.decode(IntradayInterval.self, forKey: .interval)
		self.outputSize = try container.decode(String.self, forKey: .outputSize)
		let valueString = try container.decode(String.self, forKey: .timeZone)
		self.timeZone = TimeZone(identifier: valueString) ?? .current
	}

	private enum CodingKeys: String, CodingKey {
		case information = "1. Information"
		case symbol = "2. Symbol"
		case lastRefreshed = "3. Last Refreshed"
		case interval = "4. Interval"
		case outputSize = "5. Output Size"
		case timeZone = "6. Time Zone"
	}
}
