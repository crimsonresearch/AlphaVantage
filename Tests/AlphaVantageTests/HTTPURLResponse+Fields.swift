//
//  HTTPURLResponse+Fields.swift
//
//
//  Created by Waqar Malik on 6/6/24.
//

import Foundation
import HTTPTypes

extension Array where Element == HTTPField {
	var headerFields: [String: String] {
		var headerFields = [String: String](minimumCapacity: count)
		for field in self {
			headerFields[field.name.rawName] = field.value
		}
		return headerFields
	}
}

extension HTTPURLResponse {
	convenience init(url: URL, statusCode: Int, headerFields: [HTTPField]?) {
		self.init(url: url, statusCode: statusCode, httpVersion: nil, headerFields: headerFields?.headerFields)!
	}
}
