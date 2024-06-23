//
//  AlphaVantage.swift
//
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation
import HTTPRequestable

public class AlphaVantage: HTTPTransferable, @unchecked Sendable {
	public let session: URLSession
	public var apiKey: String = ""

	public var apiKitQueryItem: URLQueryItem {
		URLQueryItem(name: "apikey", value: apiKey)
	}

	public required init(session: URLSession) {
		self.session = session
	}

	required convenience init(apiKey: String, session: URLSession = .shared) {
		self.init(session: session)
		self.apiKey = apiKey
	}

	public func getGlobalQuote(symbol: String) async throws -> GlobalQuote {
		var request = GlobalQuoteRequestable(symbol: symbol)
		request.queryItems?.insert(apiKitQueryItem)
		return try await object(for: request)
	}

	public func getTimeSeriesIntraday<T: Decodable>(symbol: String, interval: IntradayInterval) async throws -> T {
		var request = TimeSeriesIntradayRequestable<T>(symbol: symbol, interval: interval)
		request.queryItems?.append(apiKitQueryItem)
		let result = try await object(for: request)
		return result
	}

	public func getTimeSeriesDaily(symbol: String) async throws -> TimeSeriesDaily {
		var request = TimeSeriesDailyRequestable(symbol: symbol)
		request.queryItems?.append(apiKitQueryItem)
		let result = try await object(for: request)
		return result
	}

	public func getTimeSeriesWeekly(symbol: String) async throws -> TimeSeriesWeekly {
		var request = TimeSeriesWeeklyRequestable(symbol: symbol)
		request.queryItems?.append(apiKitQueryItem)
		let result = try await object(for: request)
		return result
	}

	public func getTimeSeriesMonthly(symbol: String) async throws -> TimeSeriesMonthly {
		var request = TimeSeriesMonthlyRequestable(symbol: symbol)
		request.queryItems?.append(apiKitQueryItem)
		let result = try await object(for: request)
		return result
	}

	public func getSymbolSearch(query: String) async throws -> [SearchSymbol] {
		var request = SymbolSearchRequestable(query: query)
		request.queryItems?.append(apiKitQueryItem)
		return try await object(for: request)
	}

	public func getGlobalMarketStatus() async throws -> [GlobalMarketStatus.Market] {
		var request = GlobalMarketStatusRequestable()
		request.queryItems?.append(apiKitQueryItem)
		let result = try await object(for: request)
		return result.markets
	}

	public func getTopGainersLosers() async throws -> TopGainersLosers {
		var request = TopGainersLosersRequestable()
		request.queryItems?.append(apiKitQueryItem)
		let result = try await object(for: request)
		return result
	}
}
