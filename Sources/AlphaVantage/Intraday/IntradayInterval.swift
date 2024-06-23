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
			String(localized: "intraday_interval_1min", bundle: .module)
		case .fiveMinutes:
			String(localized: "intraday_interval_5min", bundle: .module)
		case .fifteenMinutes:
			String(localized: "intraday_interval_15min", bundle: .module)
		case .thirtyMinutes:
			String(localized: "intraday_interval_30min", bundle: .module)
		case .oneHour:
			String(localized: "intraday_interval_60min", bundle: .module)
		}
	}
}

extension IntradayInterval: CustomDebugStringConvertible {
	public var debugDescription: String {
		description
	}
}
