//
//  TickerListViewModel.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

public protocol TickerListViewModelInputs {
	
	/// Call when the view did load.
	func viewDidLoad()
	
	/// Call when the view will appear.
	func viewWillAppear()
}

public protocol TickerListViewModelOutputs {
	var tickers: Signal<[Ticker], ErrorEnvelope> { get }
}

public protocol TickerListViewModelType {
	var inputs: TickerListViewModelInputs { get }
	var outputs: TickerListViewModelOutputs { get }
}

public final class TickerListViewModel: TickerListViewModelInputs, TickerListViewModelOutputs, TickerListViewModelType {

	public var inputs: TickerListViewModelInputs { return self }
	public var outputs: TickerListViewModelOutputs { return self }
	
	public var tickers: Signal<[Ticker], ErrorEnvelope>
	
	init() {
		
		tickers = viewWillAppearProperty.signal.flatMap(.latest, CoinMarketCapAPI().fetchTickers)

	}
	
	public func viewDidLoad() {
		
	}
	
	fileprivate let viewWillAppearProperty = MutableProperty(())
	public func viewWillAppear() {
		viewWillAppearProperty.value = ()
	}
}
