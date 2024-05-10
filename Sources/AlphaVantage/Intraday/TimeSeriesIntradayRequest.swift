//
//  TimeSeriesIntradayRequest.swift
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation
import HTTPRequestable

public struct TimeSeriesIntradayRequest<T: Decodable>: HTTPRequestable {
	public typealias ResultType = T
	public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.timeSeriesIntraday.rawValue)]

	public init(symbol: String, interval: IntradayInterval) {
		let item = URLQueryItem(name: "symbol", value: symbol)
		let intervalItem = URLQueryItem(name: "interval", value: interval.rawValue)
		queryItems?.insert(item)
		queryItems?.insert(intervalItem)
	}

	static var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return formatter
	}

	var dateFormatter: DateFormatter {
		Self.dateFormatter
	}

	public static var transformer: Transformer<Data, ResultType> {
		{ data, response in
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .formatted(dateFormatter)
			return try decoder.decode(T.self, from: data)
		}
	}

	public var transformer: Transformer<Data, ResultType> {
		Self.transformer
	}
}
