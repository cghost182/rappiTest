//
//  DataServices.swift
//  ChrisPelis
//
//  Created by Christian Collazos on 6/13/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import Foundation
import Alamofire
import Moya


let dataServiceAPI = MoyaProvider<MyService>(endpointClosure: endpointClosure)

let endpointClosure = { (target: MyService) -> Endpoint in
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    return Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
}


enum MyService {
    case getPopularMovies(page : String)
}

// MARK: - TargetType Protocol Implementation
extension MyService: TargetType {
    var baseURL: URL { return URL(string: "https://api.themoviedb.org")! }
    var path: String {
        switch self {
        case .getPopularMovies( _ ):
            return "/3/movie/popular"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getPopularMovies:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .getPopularMovies(page):
            return .requestParameters(parameters: ["api_key": "210e5a6afdd4fcb7b819ae821ded93a7", "language": "en-US", "page": page], encoding: URLEncoding.queryString)
        }
    }
    var sampleData: Data {
        switch self {
        case .getPopularMovies:
            return "{}".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
