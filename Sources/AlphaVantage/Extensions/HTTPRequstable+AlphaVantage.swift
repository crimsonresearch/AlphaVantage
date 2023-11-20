//
//  HTTPRequstable+AlphaVantage.swift
//
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation
import URLRequestable

public extension HTTPRequstable {
	var authority: String {
		"www.alphavantage.co"
	}

	var path: String {
		"/query"
	}
}
