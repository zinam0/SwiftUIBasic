//
//  HTTPDataDownloader.swift
//  Earthquakes
//
//  Created by Zizi on 8/6/24.
//

import Foundation

let validStatus = 200...299
//URL 비동기적으로 데이터 가져옴
protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as?(Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw QuakeError.networkError
        }
        return data
    }
}
