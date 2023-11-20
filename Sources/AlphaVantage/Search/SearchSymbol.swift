//
//  SearchSymbol.swift
//
//  Created by Waqar Malik on 11/18/23.
//

import Foundation

public struct SearchSymbol: Codable, Hashable, Sendable {
	public let symbol: String
	public let name: String
	public let type: String
	public let region: String
	public let marketOpen: String
	public let marketClose: String
	public let timeZone: TimeZone
	public let currency: String
	public let matchScore: Double

	public init(symbol: String, name: String, type: String, region: String, marketOpen: String, marketClose: String, timeZone: TimeZone, currency: String, matchScore: Double) {
		self.symbol = symbol
		self.name = name
		self.type = type
		self.region = region
		self.marketOpen = marketOpen
		self.marketClose = marketClose
		self.timeZone = timeZone
		self.currency = currency
		self.matchScore = matchScore
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.symbol = try container.decode(String.self, forKey: .symbol)
		self.name = try container.decode(String.self, forKey: .name)
		self.type = try container.decode(String.self, forKey: .type)
		self.region = try container.decode(String.self, forKey: .region)
		self.marketOpen = try container.decode(String.self, forKey: .marketOpen)
		self.marketClose = try container.decode(String.self, forKey: .marketClose)
		var valueString = try container.decode(String.self, forKey: .timeZone)
		self.timeZone = TimeZone(identifier: valueString) ?? .current
		self.currency = try container.decode(String.self, forKey: .currency)
		valueString = try container.decode(String.self, forKey: .matchScore)
		self.matchScore = Double(valueString) ?? .zero
	}

	private enum CodingKeys: String, CodingKey {
		case symbol = "1. symbol"
		case name = "2. name"
		case type = "3. type"
		case region = "4. region"
		case marketOpen = "5. marketOpen"
		case marketClose = "6. marketClose"
		case timeZone = "7. timezone"
		case currency = "8. currency"
		case matchScore = "9. matchScore"
	}
}
