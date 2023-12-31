//
//  URLProtocolMock.swift
//
//  Created by Waqar Malik on 11/17/23.
//

import Foundation

public class URLProtocolMock: URLProtocol {
	public typealias RequestHandler = (URLRequest) throws -> (HTTPURLResponse, Data?)
	public static var requestHandler: RequestHandler?

	override public class func canInit(with _: URLRequest) -> Bool { true }
	override public class func canInit(with _: URLSessionTask) -> Bool { true }
	override public class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

	override public func startLoading() {
		guard let client = client else {
			fatalError("missing client")
		}

		guard let handler = Self.requestHandler else {
			fatalError("Handler is unavailable.")
		}

		let validCodes = Set(200 ..< 300)
		do {
			let (response, data) = try handler(request)
			if !validCodes.contains(response.statusCode) {
				throw URLError(URLError.Code(rawValue: response.statusCode))
			}

			client.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

			if let data = data {
				client.urlProtocol(self, didLoad: data)
			}

			client.urlProtocolDidFinishLoading(self)
		} catch {
			client.urlProtocol(self, didFailWithError: error)
		}
	}

	override public func stopLoading() {}
}
