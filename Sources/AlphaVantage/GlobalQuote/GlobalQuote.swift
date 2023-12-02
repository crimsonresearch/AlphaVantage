//
//  GlobalQuote.swift
//
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation

public struct GlobalQuoteResponse: Codable, Hashable, Sendable {
	public let globalQuote: GlobalQuote

	public init(globalQuote: GlobalQuote) {
		self.globalQuote = globalQuote
	}

	private enum CodingKeys: String, CodingKey {
		case globalQuote = "Global Quote"
	}
}

public struct GlobalQuote: Codable, Hashable, Sendable {
	public let symbol: String
	public let open: Decimal
	public let high: Decimal
	public let low: Decimal
	public let price: Decimal
	public let volume: Int64
	public let latestTradingDay: Date
	public let previousClose: Decimal
	public let change: Decimal
	public let changePercent: Double

	static var percentFormatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .percent
		return formatter
	}()

	public init(symbol: String, open: Decimal, high: Decimal, low: Decimal, price: Decimal, volume: Int64, latestTradingDay: Date, previousClose: Decimal, change: Decimal, changePercent: Double) {
		self.symbol = symbol
		self.open = open
		self.high = high
		self.low = low
		self.price = price
		self.volume = volume
		self.latestTradingDay = latestTradingDay
		self.previousClose = previousClose
		self.change = change
		self.changePercent = changePercent
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.symbol = try container.decode(String.self, forKey: .symbol)
		var valueString = try container.decode(String.self, forKey: .open)
		self.open = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .high)
		self.high = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .low)
		self.low = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .price)
		self.price = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .volume)
		self.volume = Int64(valueString) ?? .zero
		self.latestTradingDay = try container.decode(Date.self, forKey: .latestTradingDay)
		valueString = try container.decode(String.self, forKey: .previousClose)
		self.previousClose = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .change)
		self.change = Decimal(string: valueString) ?? .zero
		let changePercentString = try container.decode(String.self, forKey: .changePercent)
		self.changePercent = Self.percentFormatter.number(from: changePercentString)?.doubleValue ?? 0.0
	}

	private enum CodingKeys: String, CodingKey {
		case symbol = "01. symbol"
		case open = "02. open"
		case high = "03. high"
		case low = "04. low"
		case price = "05. price"
		case volume = "06. volume"
		case latestTradingDay = "07. latest trading day"
		case previousClose = "08. previous close"
		case change = "09. change"
		case changePercent = "10. change percent"
	}
}
