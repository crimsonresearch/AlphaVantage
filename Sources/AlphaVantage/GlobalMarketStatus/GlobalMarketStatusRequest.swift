//
//  GlobalMarketStatusRequest.swift
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation
import HTTPTypes
import HTTPRequestable

public struct GlobalMarketStatusRequest: HTTPRequestable {
	public typealias ResultType = GlobalMarketStatus
	public var queryItems: Set<URLQueryItem>? = [URLQueryItem(name: "function", value: Function.marketStatus.rawValue)]

	public init() {}
}
