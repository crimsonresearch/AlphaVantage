//
//  HTTPRequstable+AlphaVantage.swift
//
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation
import HTTPRequestable

public extension HTTPRequestable {
  var authority: String {
    "www.alphavantage.co"
  }

  var path: String {
    "/query"
  }
}

extension HTTPRequestable where ResultType: Decodable {
  public var transformer: Transformer<Data, ResultType> {
    { data, response in
      let decoder = JSONDecoder()
      return try decoder.decode(ResultType.self, from: data)
    }
  }
}
