//
//  HTTPRequstable+AlphaVantage.swift
//
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation
import HTTPRequestable

public extension HTTPRequestable {
	var environment: HTTPEnvironment { .init(scheme: "https", authority: "www.alphavantage.co", path: "/query") }
}

public extension HTTPRequestable where ResultType: Decodable {
  var transformer: Transformer<Data, ResultType> {
    { data, _ in
      let decoder = JSONDecoder()
      return try decoder.decode(ResultType.self, from: data)
    }
  }
}
