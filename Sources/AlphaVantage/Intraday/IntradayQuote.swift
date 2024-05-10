//
//  IntradayQuote.swift
//
//  Created by Waqar Malik on 11/18/23.
//

import Foundation

public struct IntradayQuote: Codable, Hashable, Sendable {
	public let open: Decimal
	public let high: Decimal
	public let low: Decimal
	public let close: Decimal
	public let volume: Int64

	public init(open: Decimal, high: Decimal, low: Decimal, close: Decimal, volume: Int64) {
		self.open = open
		self.high = high
		self.low = low
		self.close = close
		self.volume = volume
	}

  public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		var valueString = try container.decode(String.self, forKey: .open)
		self.open = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .high)
		self.high = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .low)
		self.low = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .close)
		self.close = Decimal(string: valueString) ?? .zero
		valueString = try container.decode(String.self, forKey: .volume)
		self.volume = Int64(valueString) ?? .zero
	}

	private enum CodingKeys: String, CodingKey {
		case open = "1. open"
		case high = "2. high"
		case low = "3. low"
		case close = "4. close"
		case volume = "5. volume"
	}
}
