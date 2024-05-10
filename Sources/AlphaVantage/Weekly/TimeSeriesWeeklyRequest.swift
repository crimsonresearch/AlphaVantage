//
//  TimeSeriesWeeklyRequest.swift
//
//
//  Created by Waqar Malik on 11/18/23.
//

import Foundation
import HTTPTypes
import HTTPRequestable

public struct TimeSeriesWeeklyRequest: HTTPRequestable {
	public typealias ResultType = TimeSeriesWeekly

	public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.timeSeriesWeekly.rawValue)]

	public init(symbol: String) {
		let item = URLQueryItem(name: "symbol", value: symbol)
		queryItems?.insert(item)
	}

	static var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-mm-dd"
		return formatter
	}

	var dateFormatter: DateFormatter {
		Self.dateFormatter
	}

	public static var transformer: Transformer<Data, ResultType> {
    { data, response in
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .formatted(dateFormatter)
			return try decoder.decode(ResultType.self, from: data)
		}
	}

	public var transformer: Transformer<Data, ResultType> {
		Self.transformer
	}
}
