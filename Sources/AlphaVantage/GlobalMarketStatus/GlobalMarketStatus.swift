//
//  GlobalMarketStatus.swift
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation

public struct GlobalMarketStatus: Codable, Hashable, Sendable {
	public let endpoint: String
	public let markets: [Market]

	public init(endpoint: String, markets: [Market]) {
		self.endpoint = endpoint
		self.markets = markets
	}

	public struct Market: Codable, Hashable, Sendable {
		public let marketType: String
		public let region: String
		public let primaryExchanges: String
		public let localOpen: String
		public let localClose: String
		public let currentStatus: String
		public let notes: String

		public init(marketType: String, region: String, primaryExchanges: String, localOpen: String, localClose: String, currentStatus: String, notes: String) {
			self.marketType = marketType
			self.region = region
			self.primaryExchanges = primaryExchanges
			self.localOpen = localOpen
			self.localClose = localClose
			self.currentStatus = currentStatus
			self.notes = notes
		}

		private enum CodingKeys: String, CodingKey {
			case marketType = "market_type"
			case region
			case primaryExchanges = "primary_exchanges"
			case localOpen = "local_open"
			case localClose = "local_close"
			case currentStatus = "current_status"
			case notes
		}
	}
}
