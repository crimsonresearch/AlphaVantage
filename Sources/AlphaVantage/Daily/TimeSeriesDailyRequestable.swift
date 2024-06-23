//
//  TimeSeriesDailyRequestable.swift
//
//
//  Created by Waqar Malik on 11/18/23.
//

import Foundation
import HTTPRequestable
import HTTPTypes

public struct TimeSeriesDailyRequestable: HTTPRequestable {
	public typealias ResultType = TimeSeriesDaily

	public var queryItems: [URLQueryItem]? = [URLQueryItem(name: "function", value: Function.timeSeriesDaily.rawValue)]

	public init(symbol: String) {
		let item = URLQueryItem(name: "symbol", value: symbol)
		queryItems?.append(item)
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
		{ data, _ in
			let decoder = JSONDecoder()
			decoder.dateDecodingStrategy = .formatted(dateFormatter)
			return try decoder.decode(ResultType.self, from: data)
		}
	}

  @inlinable
	public var transformer: Transformer<Data, ResultType> {
		Self.transformer
	}
}
