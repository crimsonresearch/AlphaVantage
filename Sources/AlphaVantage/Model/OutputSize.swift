//
//  OutputSize.swift
//
//  Created by Waqar Malik on 11/16/23.
//

import Foundation

public enum OutputSize: String, Hashable, CaseIterable, Sendable, Codable {
	case compact
	case full
}

extension OutputSize: CustomStringConvertible {
	public var description: String {
		rawValue
	}
}

extension OutputSize: CustomDebugStringConvertible {
	public var debugDescription: String {
		rawValue
	}
}
