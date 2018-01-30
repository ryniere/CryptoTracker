//
//  TickerCell.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit

class TickerCell: UITableViewCell, ValueCell {

	typealias Value = Ticker

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	
	fileprivate let viewModel = TickerCellModel()
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		bindUI()
    }
	
	func bindUI() {
		viewModel.outputs.ticker.observeValues { ticker in
			
			self.nameLabel.text = ticker.name
			self.priceLabel.text = ticker.priceUSD
		}
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func configureWith(value: Ticker) {
		viewModel.inputs.configureWith(ticker: value)
	}

}
