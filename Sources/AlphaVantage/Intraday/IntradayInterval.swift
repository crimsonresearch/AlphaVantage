//
//  IntradayInterval.swift
//
//  Created by Waqar Malik on 11/16/23.
//

import Foundation

public enum IntradayInterval: String, Hashable, CaseIterable, Sendable, Codable {
	case oneMinute = "1min"
	case fiveMinutes = "5min"
	case fifteenMinutes = "15min"
	case thirtyMinutes = "30min"
	case oneHour = "60min"
}

extension IntradayInterval: CustomStringConvertible {
	public var description: String {
		switch self {
		case .oneMinute:
			return "1 Min"
		case .fiveMinutes:
			return "5 Mins"
		case .fifteenMinutes:
			return "15 Mins"
		case .thirtyMinutes:
			return "30 Mins"
		case .oneHour:
			return "60 Mins"
		}
	}
}

extension IntradayInterval: CustomDebugStringConvertible {
	public var debugDescription: String {
		switch self {
		case .oneMinute:
			return "1min"
		case .fiveMinutes:
			return "5min"
		case .fifteenMinutes:
			return "15min"
		case .thirtyMinutes:
			return "30min"
		case .oneHour:
			return "60min"
		}
	}
}
