//
//  TopGainersLosersRequestable.swift
//
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation
import HTTPRequestable
import HTTPTypes

public struct TopGainersLosersRequestable: HTTPRequestable {
	public typealias ResultType = TopGainersLosers

	public var queryItems: [URLQueryItem]? = [URLQueryItem(name: "function", value: Function.topGainersLosers.rawValue)]

	public init() {}
}
