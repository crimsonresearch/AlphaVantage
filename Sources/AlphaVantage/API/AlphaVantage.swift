//
//  AlphaVantage.swift
//
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation
import HTTPTypes
import URLRequestable

public class AlphaVantage: HTTPTransferable {
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

	public func getGlobalQuote(symbol: Symbol) async throws -> GlobalQuote {
		var request = GlobalQuoteRequest(symbol: symbol)
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result.globalQuote
	}

	public func getTimeSeriesIntraday<T: Decodable>(symbol: Symbol, interval: IntradayInterval) async throws -> T {
		var request = TimeSeriesIntradayRequest<T>(symbol: symbol, interval: interval)
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result
	}

	public func getTimeSeriesDaily(symbol: Symbol) async throws -> TimeSeriesDaily {
		var request = TimeSeriesDailyRequest(symbol: symbol)
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result
	}

	public func getTimeSeriesWeekly(symbol: Symbol) async throws -> TimeSeriesWeekly {
		var request = TimeSeriesWeeklyRequest(symbol: symbol)
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result
	}

	public func getTimeSeriesMonthly(symbol: Symbol) async throws -> TimeSeriesMonthly {
		var request = TimeSeriesMonthlyRequest(symbol: symbol)
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result
	}

	public func getSymbolSearch(query: String) async throws -> [SearchSymbol] {
		var request = SymbolSearchRequest(query: query)
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result.bestMatches
	}

	public func getGlobalMarketStatus() async throws -> [GlobalMarketStatus.Market] {
		var request = GlobalMarketStatusRequest()
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result.markets
	}

	public func getTopGainersLosers() async throws -> TopGainersLosers {
		var request = TopGainersLosersRequest()
		request.queryItems?.insert(apiKitQueryItem)
		let result = try await data(for: request)
		return result
	}
}
