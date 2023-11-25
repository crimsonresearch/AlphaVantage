//
//  GlobalQuoteRequest.swift
//
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation
import URLRequestable

public struct GlobalQuoteRequest: HTTPRequstable {
	public typealias ResultType = GlobalQuoteResponse

	public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.quote.rawValue)]

	public init(symbol: String) {
		let item = URLQueryItem(name: "symbol", value: symbol)
		queryItems?.insert(item)
	}

	public var transformer: Transformer<Data, ResultType> {
		{ data in
			let decoder = JSONDecoder()
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-mm-dd"
			decoder.dateDecodingStrategy = .formatted(formatter)
			return try decoder.decode(GlobalQuoteResponse.self, from: data)
		}
	}
}
