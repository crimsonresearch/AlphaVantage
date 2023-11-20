//
//  SymbolSearchResponse.swift
//
//  Created by Waqar Malik on 11/18/23.
//

import Foundation

public struct SymbolSearchResponse: Codable, Hashable, Sendable {
	public let bestMatches: [SearchSymbol]

	public init(bestMatches: [SearchSymbol]) {
		self.bestMatches = bestMatches
	}
}
