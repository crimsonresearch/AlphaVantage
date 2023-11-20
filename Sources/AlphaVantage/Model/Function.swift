//
//  Function.swift
//
//  Created by Waqar Malik on 11/16/23.
//

import Foundation

public enum Function: String, Hashable, CaseIterable, Sendable, Codable {
	case timeSeriesIntraday = "TIME_SERIES_INTRADAY"
	case timeSeriesDaily = "TIME_SERIES_DAILY"
	case timeSeriesDailyAdjusted = "TIME_SERIES_DAILY_ADJUSTED"
	case timeSeriesWeekly = "TIME_SERIES_WEEKLY"
	case timeSeriesWeeklyAdjusted = "TIME_SERIES_WEEKLY_ADJUSTED"
	case timeSeriesMonthly = "TIME_SERIES_MONTHLY"
	case timeSeriesMonthlyAdjusted = "TIME_SERIES_MONTHLY_ADJUSTED"
	case quote = "GLOBAL_QUOTE"
	case search = "SYMBOL_SEARCH"
	case marketStatus = "MARKET_STATUS"
	case newsSentiment = "NEWS_SENTIMENT"
	case topGainersLosers = "TOP_GAINERS_LOSERS"
}

extension Function: CustomStringConvertible {
	public var description: String {
		switch self {
		case .timeSeriesIntraday:
			return "Intraday Time Series"
		case .timeSeriesDaily:
			return "Daily Time Series"
		case .timeSeriesDailyAdjusted:
			return "Daily Adjusted Time Series"
		case .timeSeriesWeekly:
			return "Weekly Time Series"
		case .timeSeriesWeeklyAdjusted:
			return "Weekly Adjusted Time Series"
		case .timeSeriesMonthly:
			return "Monthly Time Series"
		case .timeSeriesMonthlyAdjusted:
			return "Monthly Adjusted Time Series"
		case .quote:
			return "Quote"
		case .search:
			return "Search"
		case .marketStatus:
			return "Market Status"
		case .newsSentiment:
			return "News Sentiment"
		case .topGainersLosers:
			return "Top Gainers/Losers"
		}
	}
}

extension Function: CustomDebugStringConvertible {
	public var debugDescription: String {
		rawValue
	}
}
