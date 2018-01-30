//
//  UIView-Extensions.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit
extension UIView {
	
	public static var defaultReusableId: String {
		return self.description()
			.components(separatedBy: ".")
			.dropFirst()
			.joined(separator: ".")
	}
}
