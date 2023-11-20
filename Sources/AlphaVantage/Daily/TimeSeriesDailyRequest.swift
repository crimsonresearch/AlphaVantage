//
//  TimeSeriesDailyRequest.swift
//
//
//  Created by Waqar Malik on 11/18/23.
//

import Foundation
import HTTPTypes
import URLRequestable

public struct TimeSeriesDailyRequest: HTTPRequstable {
	public typealias ResultType = TimeSeriesDaily

	public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.timeSeriesDaily.rawValue)]

	public init(symbol: Symbol) {
		let item = URLQueryItem(name: "symbol", value: symbol)
		queryItems?.insert(item)
	}

	public var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
		return formatter
	}

	public var transformer: Transformer<Data, ResultType> {
		{ data in
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .formatted(dateFormatter)
			return try decoder.decode(ResultType.self, from: data)
		}
	}
}
