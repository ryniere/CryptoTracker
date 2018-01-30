//
//  Ticker.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 26/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit

public struct Ticker: Codable {

	var id = ""
	var name = ""
	var symbol = ""
	var rank = ""
	var priceUSD = ""
	var priceBTC = ""
	var volume24hUSD = ""
	var marketCapUSD = ""
	var availableSupply = ""
	var totalSupply = ""
	var percentChange1h = ""
	var percentChange24h = ""
	var percentChange7d = ""
	var lastUpdated = ""
	
	enum CodingKeys : String, CodingKey {
		case id
		case name
		case symbol
		case rank
		case priceUSD = "price_usd"
		case priceBTC = "price_btc"
		case volume24hUSD = "24h_volume_usd"
		case marketCapUSD = "market_cap_usd"
		case availableSupply = "available_supply"
		case totalSupply = "total_supply"
		case percentChange1h = "percent_change_1h"
		case percentChange24h = "percent_change_24h"
		case percentChange7d = "percent_change_7d"
		case lastUpdated = "last_updated"
	}
	
}
