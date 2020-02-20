//
//  Services.swift
//  Ali
//
//  Created by Ali Asad on 20/02/2020.
//  Copyright © 2019 Ali Asad. All rights reserved.
//

import Foundation
import Moya

private let publicKey = "pDz1JyAwwMmS9fYXPSaC9ZR9bdaZqD76"

struct NetworkProvider {
    static let provider = MoyaProvider<NYTimesServices>()
}

enum NYTimesServices {
    case getArticles(period: Int)
}

extension NYTimesServices: TargetType {
    var baseURL: URL {
        
        switch self  {
        case .getArticles:
            return URL(string: Constants.API.populatArticlesBaseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .getArticles(let period):
            return "/mostviewed/all-sections/\(period)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getArticles:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        
        case .getArticles:
            let parameters = [ "api-key": publicKey] as [String : Any]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getArticles:
            return ["Content-type": "application/json"]
        
        }
    }
}
