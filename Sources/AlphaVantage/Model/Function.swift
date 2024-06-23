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
			String(localized: "function_intraday_time_series", bundle: .module)
		case .timeSeriesDaily:
			String(localized: "function_daily_time_series", bundle: .module)
		case .timeSeriesDailyAdjusted:
			String(localized: "function_daily_adjusted_time_series", bundle: .module)
		case .timeSeriesWeekly:
			String(localized: "function_weekly_time_series", bundle: .module)
		case .timeSeriesWeeklyAdjusted:
			String(localized: "function_weekly_adjusted_time_series", bundle: .module)
		case .timeSeriesMonthly:
			String(localized: "function_monthly_time_series", bundle: .module)
		case .timeSeriesMonthlyAdjusted:
			String(localized: "function_monthly_adjusted_time_series", bundle: .module)
		case .quote:
			String(localized: "function_quote", bundle: .module)
		case .search:
			String(localized: "function_search", bundle: .module)
		case .marketStatus:
			String(localized: "function_market_status", bundle: .module)
		case .newsSentiment:
			String(localized: "function_news_sentiment", bundle: .module)
		case .topGainersLosers:
			String(localized: "function_top_gainers_losers", bundle: .module)
		}
	}
}

extension Function: CustomDebugStringConvertible {
	public var debugDescription: String {
		rawValue
	}
}
