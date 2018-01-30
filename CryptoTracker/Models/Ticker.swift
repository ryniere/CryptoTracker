//
//  Ticker.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 26/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit

class Ticker: Codable {

	var id = ""
	var name = ""
	var symbol = ""
	var rank = 0
	var priceUSD = 0
	var priceBTC = 0
	var volume24hUSD = 0
	var marketCapUSD = 0
	var availableSupply = 0
	var totalSupply = 0
	var percentChange1h = 0
	var percentChange24h = 0
	var percentChange7d = 0
	var lastUpdated = 0
	
	enum CodingKeys : String, CodingKey {
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
