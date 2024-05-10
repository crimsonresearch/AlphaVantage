//
//  TopGainersLosers.swift
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation

public struct TopGainersLosers: Codable, Hashable, Sendable {
	public let metadata: String
	public let lastUpdated: String
	public let gainers: [Ticker]
	public let losers: [Ticker]
	public let mostActivelyTraded: [Ticker]

	public init(metadata: String, lastUpdated: String, gainers: [Ticker], losers: [Ticker], mostActivelyTraded: [Ticker]) {
		self.metadata = metadata
		self.lastUpdated = lastUpdated
		self.gainers = gainers
		self.losers = losers
		self.mostActivelyTraded = mostActivelyTraded
	}

	public struct Ticker: Codable, Hashable, Sendable {
		public let ticker: String
		public let price: Decimal
		public let changeAmount: Decimal
		public let changePercentage: Decimal
		public let volume: Int64

		public init(ticker: String, price: Decimal, changeAmount: Decimal, changePercentage: Decimal, volume: Int64) {
			self.ticker = ticker
			self.price = price
			self.changeAmount = changeAmount
			self.changePercentage = changePercentage
			self.volume = volume
		}

    public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.ticker = try container.decode(String.self, forKey: .ticker)
			var valueString = try container.decode(String.self, forKey: .price)
			self.price = Decimal(string: valueString) ?? .zero
			valueString = try container.decode(String.self, forKey: .changeAmount)
			self.changeAmount = Decimal(string: valueString) ?? .zero
			valueString = try container.decode(String.self, forKey: .changePercentage)
			self.changePercentage = Decimal(string: valueString) ?? .zero
			valueString = try container.decode(String.self, forKey: .volume)
			self.volume = Int64(valueString) ?? .zero
		}

		private enum CodingKeys: String, CodingKey {
			case ticker
			case price
			case changeAmount = "change_amount"
			case changePercentage = "change_percentage"
			case volume
		}
	}

	private enum CodingKeys: String, CodingKey {
		case metadata
		case lastUpdated = "last_updated"
		case gainers = "top_gainers"
		case losers = "top_losers"
		case mostActivelyTraded = "most_actively_traded"
	}
}
