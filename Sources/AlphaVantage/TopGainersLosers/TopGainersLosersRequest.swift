//
//  TopGainersLosersRequest.swift
//
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation
import HTTPTypes
import URLRequestable

public struct TopGainersLosersRequest: HTTPRequestable {
  public typealias ResultType = TopGainersLosers

  public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.topGainersLosers.rawValue)]

  public init() {}
}
