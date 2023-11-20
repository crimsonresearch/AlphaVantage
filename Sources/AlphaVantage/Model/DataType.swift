//
//  DataType.swift
//
//  Created by Waqar Malik on 11/16/23.
//

import Foundation

public enum DataType: String, Hashable, CaseIterable, Sendable, Codable {
	case json
	case csv
}

extension DataType: CustomStringConvertible {
	public var description: String {
		rawValue
	}
}

extension DataType: CustomDebugStringConvertible {
	public var debugDescription: String {
		rawValue
	}
}
