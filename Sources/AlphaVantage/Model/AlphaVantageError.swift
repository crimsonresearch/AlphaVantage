//
//  AlphaVantageError.swift
//
//
//  Created by Waqar Malik on 5/12/24.
//

import Foundation

public enum AlphaVantageError: LocalizedError {
	case invalid(String)
	case conversion(String)
	case unknownError

	public var errorDescription: String? {
		switch self {
		case .invalid(let message):
			return String(localized: "invalid", bundle: .module) + ": \(message)"
		case .conversion(let message):
			return String(localized: "conversion", bundle: .module) + ": \(message)"
		case .unknownError:
			return String(localized: "unknown_error", bundle: .module)
		}
	}
}
