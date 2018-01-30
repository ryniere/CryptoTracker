//
//  TickerDataSource.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit

class TickerDataSource: ValueCellDataSource {

	typealias Value = Ticker
	
	internal func load(tickers: [Ticker]) {
		self.set(values: tickers, cellClass: TickerCell.self, inSection: 0)
	}
	
	internal override func configureCell(tableCell cell: UITableViewCell, withValue value: Any) {
		switch (cell, value) {
		case let (cell as TickerCell, value as Ticker):
			cell.configureWith(value: value)
		default:
			assertionFailure("Unrecognized (\(type(of: cell)), \(type(of: value))) combo.")
		}
	}
}
