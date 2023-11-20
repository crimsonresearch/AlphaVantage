//
//  File.swift
//  
//
//  Created by Waqar Malik on 11/19/23.
//

import Foundation

public enum NewsTopics: String, Hashable, CaseIterable, Sendable, Codable {
  case blockchain
  case earnings
  case ipo
  case mergersAndAcquisitions = "mergers_and_acquisitions"
  case financialMarkets = "financial_markets"
  case economyFiscal = "economy_fiscal" //Economy - Fiscal Policy (e.g., tax reform, government spending)
  case economyMonetary = "economy_monetary" //Economy - Monetary Policy (e.g., interest rates, inflation)
  case economyMacro = "economy_macro" //Economy - Macro/Overall
  case energyTransportation = "energy_transportation"
  case finance
  case lifeSciences = "life_sciences"
  case manufacturing
  case realEstate = "real_estate"
  case retailWholesale = "retail_wholesale"
  case technology
}

extension NewsTopics: CustomStringConvertible {
  public var description: String {
    rawValue
  }
}
