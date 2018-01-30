//
//  TickerCellModel.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

public protocol TickerCellModelInputs{
	func configureWith(ticker: Ticker)
}

public protocol TickerCellModelOutputs{
	
	var ticker: Signal<Ticker, NoError> { get }
}

public protocol TickerCellModelType {
	var inputs: TickerCellModelInputs { get }
	var outputs: TickerCellModelOutputs { get }
}

public class TickerCellModel: TickerCellModelInputs, TickerCellModelOutputs, TickerCellModelType {

	public var inputs: TickerCellModelInputs { return self }
	public var outputs: TickerCellModelOutputs { return self }
	
	init() {
		ticker = self.tickerProperty.signal.skipNil()
	}
	
	public var ticker: Signal<Ticker, NoError>
	
	fileprivate var tickerProperty = MutableProperty<Ticker?>(nil)
	public func configureWith(ticker: Ticker) {
		tickerProperty.value = ticker
	}
}
