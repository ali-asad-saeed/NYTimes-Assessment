//
//  APIResult.swift
//  Ali
//
//  Created by Ali Asad on 20/02/2020.
//  Copyright © 2019 Ali Asad. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case success(T)
    case failure(String)
    
    var value: T? {
        switch self {
            case .success(let value): return value
            case .failure: return nil
        }
    }
}
