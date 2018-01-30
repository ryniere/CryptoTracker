//
//  Route.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import Foundation

/**
A list of possible requests that can be made for data.
*/
internal enum Route {
	case tickers(count: Int?)
	
	enum UploadParam: String {
		case image
		case video
	}
	
	internal var requestProperties:
		(method: Method, path: String, query: [String: Any], file: (name: UploadParam, url: URL)?) {
		
		
		switch self {
		case let .tickers(count):
			var params: [String: Any] = [:]
			params["count"] = count
			return (.GET, "v1/ticker/", params, nil)
		}
	}
}
