//
//  GlobalMarketStatusRequestable.swift
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation
import HTTPRequestable
import HTTPTypes

public struct GlobalMarketStatusRequestable: HTTPRequestable {  
	public typealias ResultType = GlobalMarketStatus
	public var queryItems: [URLQueryItem]? = [URLQueryItem(name: "function", value: Function.marketStatus.rawValue)]
  
	public init() {}
}
