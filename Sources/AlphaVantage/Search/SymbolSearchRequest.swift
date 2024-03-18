//
//  SymbolSearchRequest.swift
//
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation
import HTTPTypes
import URLRequestable

public struct SymbolSearchRequest: HTTPRequestable {
	public typealias ResultType = SymbolSearchResponse
	public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.search.rawValue)]
  
	public init(query: String) {
		let item = URLQueryItem(name: "keywords", value: query)
		queryItems?.insert(item)
	}
}
