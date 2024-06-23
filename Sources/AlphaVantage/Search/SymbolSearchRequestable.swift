//
//  SymbolSearchRequestable.swift
//
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation
import HTTPRequestable
import HTTPTypes

public struct SymbolSearchRequestable: HTTPRequestable {
 	public typealias ResultType = [SearchSymbol]
	public var queryItems: [URLQueryItem]? = [URLQueryItem(name: "function", value: Function.search.rawValue)]

	public init(query: String) {
		let item = URLQueryItem(name: "keywords", value: query)
		queryItems?.append(item)
	}

  @inlinable
	public static var transformer: Transformer<Data, ResultType> {
		{ data, _ in
			try JSONDecoder().decode(SymbolSearchResponse.self, from: data).bestMatches
		}
	}
  
  @inlinable
  public var transformer: Transformer<Data, ResultType> {
    Self.transformer
  }
}
