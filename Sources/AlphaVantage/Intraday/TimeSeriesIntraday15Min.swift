//
//  TimeSeriesIntraday15Min.swift
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation

public struct TimeSeriesIntraday15Min: Codable, Hashable, Sendable {
	public let metadata: IntradayMetadata
	public let timeSeries: [String: IntradayQuote]

	public init(metadata: IntradayMetadata, timeSeries: [String: IntradayQuote]) {
		self.metadata = metadata
		self.timeSeries = timeSeries
	}

	private enum CodingKeys: String, CodingKey {
		case metadata = "Meta Data"
		case timeSeries = "Time Series (15min)"
	}
}
