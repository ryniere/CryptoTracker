//
//  TickerListViewController.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class TickerListViewController: UIViewController {

	//View Model
	internal let viewModel: TickerListViewModelType = TickerListViewModel()
	fileprivate let dataSource = TickerDataSource()
	
	@IBOutlet weak var tickerTableView: UITableView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		tickerTableView.dataSource = dataSource
		
		bindUI()
		
		viewModel.inputs.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		viewModel.inputs.viewWillAppear()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func bindUI() {
		
		self.viewModel.outputs.tickers.observe { signal in
			
			guard let tickers = signal.value else {
				return
			}
			
			DispatchQueue.main.async {
				self.dataSource.load(tickers: tickers)
				self.tickerTableView.reloadData()
			}
		}
		
	}
	
	func reloadData(tickers:[Ticker]){
		
	}


}
