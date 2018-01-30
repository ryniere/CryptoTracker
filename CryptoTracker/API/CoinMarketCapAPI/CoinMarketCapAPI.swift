//
//  CoinMarketCapAPI.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import Alamofire
import Result

struct CoinMarketCapAPI {
	
	private static let session = URLSession(configuration: .default)
	let apiBaseURL = URL(string: "https://api.coinmarketcap.com/")!
	
	func fetchTickers() ->
		SignalProducer<[Ticker], ErrorEnvelope>{
		return request(.tickers(count: 0))
	}
	
	private func decodeModel<M: Swift.Decodable>(_ data: Data, urlResponde:URLResponse) ->
		SignalProducer<M, ErrorEnvelope> {
			
			return SignalProducer(value: data)
				.flatMap(.concat) { (data: Data) -> SignalProducer<M, ErrorEnvelope> in
					let decoder = JSONDecoder()
					do {
						let result = try decoder.decode(M.self, from: data)
						return .init(value: result)
					} catch {
						print("Codable decoding model \(M.self) error: \(error)")
						return .init(error: ErrorEnvelope.couldNotDecodeJSON(error))
					}
			}
	}
	
	private func request<M: Swift.Decodable>(_ route: Route)
		-> SignalProducer<M, ErrorEnvelope> {
			
			let properties = route.requestProperties
			
			guard let URL = URL(string: properties.path, relativeTo: apiBaseURL) else {
				fatalError(
					"URL(string: \(properties.path), relativeToURL: \(apiBaseURL)) == nil"
				)
			}
			
			let request = URLRequest(url: URL)
			
			return URLSession.shared.reactive.data(with: request).mapError { ErrorEnvelope.parseError(cocoa: $0)!}.flatMap(.latest, decodeModel)
	}
	


}

