//
//  GlobalMarketStatusRequest.swift
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation
import HTTPTypes
import URLRequestable

public struct GlobalMarketStatusRequest: HTTPRequstable {
	public typealias ResultType = GlobalMarketStatus
	public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.marketStatus.rawValue)]

	public init() {}
}
