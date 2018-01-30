//
//  ErrorEnvelope.swift
//  CryptoTracker
//
//  Created by Ryniere S Silva on 30/01/2018.
//  Copyright © 2018 Ryniere dos Santos Silva. All rights reserved.
//

import UIKit
import Result

public struct ErrorEnvelope: Error {

	public let errorMessages: [String]
	public let errorCode: ErrorCode?
	public let httpCode: Int
	public let exception: Exception?
	
	public enum ErrorCode: String {

		// Catch all code for when server sends code we don't know about yet
		case UnknownCode = "__internal_unknown_code"
		
		// Codes defined by the client
		case JSONParsingFailed = "json_parsing_failed"
		case ErrorEnvelopeJSONParsingFailed = "error_json_parsing_failed"
		case DecodingJSONFailed = "decoding_json_failed"
		case InvalidPaginationUrl = "invalid_pagination_url"
	}
	
	
	
	public struct Exception {
		public let backtrace: [String]?
		public let message: String?
	}
	
	/**
	A general error that some JSON could not be decoded.
	
	- parameter decodeError: The Argo decoding error.
	
	- returns: An error envelope that describes why decoding failed.
	*/
	internal static func couldNotDecodeJSON(_ decodeError: Error) -> ErrorEnvelope {
		return ErrorEnvelope(
			errorMessages: ["Codable decoding error: \(decodeError.localizedDescription)"],
			errorCode: .DecodingJSONFailed,
			httpCode: 400,
			exception: nil
		)
	}
	
	internal static func parseError(cocoa: AnyError) -> ErrorEnvelope?{
		return nil
	}
	internal static func parseError(cocoa: NoError) -> ErrorEnvelope?{
		return nil
	}
}
