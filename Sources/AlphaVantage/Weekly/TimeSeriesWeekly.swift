//
//  TimeSeriesWeekly.swift
//
//
//  Created by Waqar Malik on 11/18/23.
//

import Foundation

public struct TimeSeriesWeekly: Codable, Hashable, Sendable {
	public let metadata: Metadata
	public let timeSeries: [String: IntradayQuote]

	public init(metadata: Metadata, timeSeries: [String: IntradayQuote]) {
		self.metadata = metadata
		self.timeSeries = timeSeries
	}

	private enum CodingKeys: String, CodingKey {
		case metadata = "Meta Data"
		case timeSeries = "Weekly Time Series"
	}

	public struct Metadata: Codable, Hashable, Sendable {
		public let information: String
		public let symbol: String
		public let lastRefreshed: Date
		public let timeZone: TimeZone

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.information = try container.decode(String.self, forKey: .information)
			self.symbol = try container.decode(String.self, forKey: .symbol)
			self.lastRefreshed = try container.decode(Date.self, forKey: .lastRefreshed)
			let valueString = try container.decode(String.self, forKey: .timeZone)
			self.timeZone = TimeZone(identifier: valueString) ?? .current
		}

		private enum CodingKeys: String, CodingKey {
			case information = "1. Information"
			case symbol = "2. Symbol"
			case lastRefreshed = "3. Last Refreshed"
			case timeZone = "4. Time Zone"
		}
	}
}
